/**
 * 
 */
package cn.bc.index;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.ColumnMapRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.StringUtils;

import cn.bc.core.util.DateUtils;
import cn.bc.identity.domain.Actor;
import cn.bc.identity.web.SystemContext;

/**
 * 获取主页边栏数据的Service
 * 
 * @author dragon
 * 
 */
public class SidebarServiceImpl implements SidebarService {
	private static Log logger = LogFactory.getLog(SidebarServiceImpl.class);
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Map<String, Object>> find(SystemContext context) {
		Actor user = context.getUser();
		Long userId = user.getId();
		String userCode = user.getCode();
		List<String> groupCodes = context.getAttr(SystemContext.KEY_GROUPS);
		boolean emptyGroup = (groupCodes == null || groupCodes.isEmpty());

		// 查询的参数
		List<Object> args = new ArrayList<Object>();

		// -- sql:个人待办
		StringBuffer sql4todo = new StringBuffer();
		sql4todo.append("(select 'todo' as type,t.proc_inst_id_ id\r\n");
		sql4todo.append("	,(select e.author_name from bc_wf_excution_log e where e.tid=t.id_ and type_='task_delegate') special\r\n");
		sql4todo.append("	,t.create_time_ as time,t.name_ title,pd.name_ as content\r\n");
		sql4todo.append("	,getprocessinstancesubject(t.proc_inst_id_) p_subject,t.id_ t_id,t.due_date_ t_duedate,pi.suspension_state_ p_status\r\n");
		sql4todo.append("	from act_ru_task t\r\n");
		sql4todo.append("	inner join act_ru_execution pi on pi.proc_inst_id_ = t.proc_inst_id_\r\n");
		sql4todo.append("	inner join act_re_procdef pd on pd.id_ = t.proc_def_id_ \r\n");
		sql4todo.append("	where pi.suspension_state_=1 \r\n");
		sql4todo.append("	and t.assignee_ = ?)");
		args.add(userCode);

		// -- sql:岗位待办
		StringBuffer sql4g = new StringBuffer();
		if (!emptyGroup) {
			sql4g.append("(select 'groupTodo' as type,t.proc_inst_id_ id\r\n");
			sql4g.append("	,g.name special\r\n");
			sql4g.append("	,t.create_time_ as time,t.name_ title,pd.name_ as content\r\n");
			sql4g.append("	,getprocessinstancesubject(t.proc_inst_id_) p_subject,t.id_ t_id,t.due_date_ t_duedate,pi.suspension_state_ p_status\r\n");
			sql4g.append("	from act_ru_task t\r\n");
			sql4g.append("	inner join act_ru_execution pi on pi.proc_inst_id_ = t.proc_inst_id_\r\n");
			sql4g.append("	inner join act_re_procdef pd on pd.id_ = t.proc_def_id_ \r\n");
			sql4g.append("	inner join act_ru_identitylink l on l.task_id_ = t.id_\r\n");
			sql4g.append("	inner join bc_identity_actor g on g.code = l.group_id_\r\n");
			sql4g.append("	where pi.suspension_state_=1 \r\n");
			sql4g.append("	and t.assignee_ is null\r\n");
			if (groupCodes.size() == 1) {
				sql4g.append("	and l.group_id_ = ?)");
			} else {
				sql4g.append("	and l.group_id_ in(?");
				for (int i = 1; i < groupCodes.size(); i++) {
					sql4g.append(",?");
				}
				sql4g.append(")");
			}
			sql4g.append(")");
			args.addAll(groupCodes);
		}

		// 合并个人待办和岗位待办的语句
		StringBuffer sql = new StringBuffer();
		sql.append("(select type,type||':'||id as id,id as dbid,time\r\n");
		sql.append("	,(case when type='todo'\r\n");
		sql.append("		then (case when special is null or special='' then title else '['||special||'委托您]'||title end)\r\n");
		sql.append("		else special end) title\r\n");
		sql.append("	,(case when p_subject is null or p_subject='' then content else p_subject end) as content\r\n");
		sql.append("	,special\r\n");
		if (emptyGroup) {// 无岗位待办
			sql.append("from \r\n");
			sql.append(sql4todo);
			sql.append("\r\n wf)");
		} else {// 有岗位待办
			sql.append("from (\r\n");
			sql.append(sql4todo);
			sql.append("\r\n union all \r\n");
			sql.append(sql4g);
			sql.append("\r\n) wf)");
		}

		// -- sql:未读邮件
		StringBuffer sql4e = new StringBuffer();
		sql4e.append("(select 'email' as type,'email'||':'||e.id id,''||e.id as dbid,e.send_date as time,e.subject title,null as content,null special\r\n");
		sql4e.append("	from bc_email_to t\r\n");
		sql4e.append("	inner join bc_email e on e.id=t.pid\r\n");
		sql4e.append("	inner join bc_identity_actor a on a.id=e.sender_id\r\n");
		sql4e.append("	where e.status_=1\r\n");
		sql4e.append("	and t.receiver_id=? and t.read_ = ?\r\n");
		sql4e.append("	and not exists(select 1 from bc_email_trash te where te.pid=e.id and te.owner_id=t.receiver_id and te.src=2)");
		sql4e.append(")");
		args.add(userId);
		args.add(new Boolean(false));

		// 合并未读邮件的查询语句
		sql.append("\r\n union all \r\n");
		sql.append(sql4e);
		sql.append("\r\n order by time desc");
		
		// debug
		if (logger.isDebugEnabled()) {
			logger.debug("args="
					+ StringUtils.collectionToCommaDelimitedString(args));
			logger.debug("sql=" + sql.toString());
		}

		// 执行查询
		List<Map<String, Object>> all;
		all = this.jdbcTemplate.query(sql.toString(), args.toArray(),
				new ColumnMapRowMapper());

		// all = new ArrayList<Map<String, Object>>();
		// createTestData(all);
		return all;
	}

	protected void createTestData(List<Map<String, Object>> all) {
		Map<String, Object> map;
		Calendar now;
		// test: todo
		for (int i = 1; i < 3; i++) {
			map = new HashMap<String, Object>();
			map.put("id", "todo:" + i);
			map.put("dbid", i);
			map.put("type", "todo");
			now = Calendar.getInstance();
			now.add(Calendar.DATE, i - 1);
			map.put("time", DateUtils.formatCalendar2Second(now));
			map.put("title", "待办标题" + i);
			if (i % 2 == 0)
				map.put("content", "待办内容" + i);
			else
				map.put("content",
						"长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容长待办内容"
								+ i);
			all.add(map);
		}

		// test: email
		for (int i = 10; i < 13; i++) {
			map = new HashMap<String, Object>();
			map.put("id", i);
			map.put("dbid", i);
			map.put("type", "email");
			now = Calendar.getInstance();
			now.add(Calendar.DATE, i - 1);
			map.put("time", DateUtils.formatCalendar2Second(now));
			map.put("title", "邮件标题" + i);
			if (i % 2 == 0)
				map.put("content", "邮件内容" + i);
			else
				map.put("content",
						"长邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容"
								+ i);

			all.add(map);
		}
	}
}
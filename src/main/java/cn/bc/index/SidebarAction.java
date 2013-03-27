/**
 * 
 */
package cn.bc.index;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.bc.Context;
import cn.bc.core.util.DateUtils;
import cn.bc.identity.web.SystemContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author dragon
 * 
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class SidebarAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	private static Log logger = LogFactory.getLog(SidebarAction.class);
	private Map<String, Object> session;
	public String json;
	public String contextPath;

	private SidebarService sidebarService;

	@Autowired
	public void setSidebarService(SidebarService sidebarService) {
		this.sidebarService = sidebarService;
	}

	public SidebarAction() {
		contextPath = ServletActionContext.getRequest().getContextPath();
	}

	public Context getContext() {
		return (Context) this.session.get(Context.KEY);
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String execute() throws Exception {
		Date startTime = new Date();
		JSONArray jsons = new JSONArray();
		JSONObject json;
		SystemContext context = (SystemContext) this.session.get(Context.KEY);

		Calendar now;
		// test: todo
		for (int i = 1; i < 3; i++) {
			json = new JSONObject();
			json.put("id", "todo:" + i);
			json.put("dbid", i);
			json.put("type", "todo");
			now = Calendar.getInstance();
			now.add(Calendar.DATE, i-1);
			json.put("time", DateUtils.formatCalendar2Second(now));
			json.put("title", "待办标题" + i);
			json.put("content", "待办内容" + i);
			jsons.put(json);
		}
		// test: email
		for (int i = 10; i < 13; i++) {
			json = new JSONObject();
			json.put("id", i);
			json.put("dbid", i);
			json.put("type", "email");
			now = Calendar.getInstance();
			now.add(Calendar.DATE, i-1);
			json.put("time", DateUtils.formatCalendar2Second(now));
			json.put("title", "邮件标题" + i);
			json.put("content", "邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容邮件内容" + i);
			jsons.put(json);
		}

		if (logger.isInfoEnabled())
			logger.info("get sidebar data：" + DateUtils.getWasteTime(startTime));

		this.json = jsons.toString();
		return "json";
	}
}
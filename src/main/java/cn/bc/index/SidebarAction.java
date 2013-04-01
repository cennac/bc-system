/**
 * 
 */
package cn.bc.index;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
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
		SystemContext context = (SystemContext) this.session.get(Context.KEY);
		List<Map<String, Object>> all = this.sidebarService.find(context);

		if (logger.isInfoEnabled())
			logger.info("get sidebar data：" + DateUtils.getWasteTime(startTime));

		// 将日期转换为字符串
		for (Map<String, Object> m : all) {
			m.put("time", DateUtils.formatDateTime((Date) m.get("time")));
		}
		this.json = new JSONArray(all).toString();
		return "json";
	}
}
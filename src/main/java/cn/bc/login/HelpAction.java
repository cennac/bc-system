/**
 * 
 */
package cn.bc.login;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 帮助处理
 * 
 * @author dragon
 * 
 */
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
public class HelpAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	//private static Log logger = LogFactory.getLog(HelpAction.class);
	public String key;// 帮助的key

	public String execute() throws Exception {
		return SUCCESS;
	}
}
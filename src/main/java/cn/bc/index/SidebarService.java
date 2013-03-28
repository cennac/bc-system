/**
 * 
 */
package cn.bc.index;

import java.util.List;
import java.util.Map;

import cn.bc.identity.web.SystemContext;

/**
 * 获取主页边栏数据的Service
 * 
 * @author dragon
 * 
 */
public interface SidebarService {
	/**
	 * 获取用户的所有边栏信息
	 * 
	 * @param context
	 *            上下文
	 * @return
	 */
	List<Map<String, Object>> find(SystemContext context);
}

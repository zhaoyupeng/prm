package com.yonyou.commons.shiro;

import com.yonyou.commons.utils.StringUtils;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ajax shiro session超时统一处理
 * 
 * 参考：http://looooj.github.io/blog/2014/06/17/shiro-user-filter.html
 *
 */
public class ShiroAjaxSessionFilter extends UserFilter {

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		HttpServletRequest req = WebUtils.toHttp(request);
		String xmlHttpRequest = req.getHeader("X-Requested-With");
		if (StringUtils.isNotBlank(xmlHttpRequest)) {
			if (xmlHttpRequest.equalsIgnoreCase("XMLHttpRequest")) {
				HttpServletResponse res = WebUtils.toHttp(response);
				// 采用res.sendError(401);在Easyui中会处理掉error，$.ajaxSetup中监听不到
				res.setHeader("oauthstatus", "401");
				return false;
			}
		}
		//跳转登录页面
		return super.onAccessDenied(request, response);
	}

}
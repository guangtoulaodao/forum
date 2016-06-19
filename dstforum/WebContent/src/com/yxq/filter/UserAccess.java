package com.yxq.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yxq.actionform.UserForm;

public class UserAccess implements Filter {
	private FilterConfig filterConfig;

	public void destroy() {
		this.filterConfig=null;
	}

	public void doFilter(ServletRequest Srequest, ServletResponse Sresponse, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)Srequest;
		HttpServletResponse response=(HttpServletResponse)Sresponse;
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("logoner");
		if(obj!=null&&(obj instanceof UserForm)){
			chain.doFilter(request, response);
		}		
		else{
			request.setAttribute("message","<b><li>ÄúÃ»ÓÐµÇÂ¼£¡ÇëÏÈµÇÂ¼£¡</li></b>");	
			RequestDispatcher rd=request.getRequestDispatcher("/pages/login.jsp");
			rd.forward(Srequest,Sresponse);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
	}
}

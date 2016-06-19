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
import javax.servlet.http.HttpSession;

import com.yxq.actionform.UserForm;
public class AdminAccess implements Filter {
	private FilterConfig filterConfig;

	public void destroy() {
		this.filterConfig=null;
	}

	public void doFilter(ServletRequest Srequest, ServletResponse Sresponse, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)Srequest;
		HttpSession session=request.getSession();
		Object obj=session.getAttribute("logoner");
		if(obj!=null&&(obj instanceof UserForm)){
			UserForm logoner=(UserForm)obj;
			String able=logoner.getUserAble();
			if(able.equals("2")){				
				chain.doFilter(Srequest, Sresponse);				
			}
			else{				
				request.setAttribute("message","<b><li>您没有权限进行该操作！</li></b>");
				RequestDispatcher rd=request.getRequestDispatcher("/pages/message.jsp");
				rd.forward(Srequest,Sresponse);
			}
		}
		else{			
			request.setAttribute("message","<b><li>您没有登录，请先登录！</li></b>");
			RequestDispatcher rd=request.getRequestDispatcher("/pages/login.jsp");
			rd.forward(Srequest,Sresponse);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
	}
}

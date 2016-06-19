package com.yxq.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts.actions.DispatchAction;

public class MySuperAction extends DispatchAction {
	public void setParams(HttpServletRequest request){		
		HttpSession session=request.getSession();
		
		String path=request.getServletPath();
		if(path!=null&!path.equals(""))
			path=path.substring(1);			
		session.setAttribute("servletPath",path);

		String method=request.getParameter("method");
		if(method!=null&&!method.equals(""))
			session.setAttribute("method",method);	
	}
}

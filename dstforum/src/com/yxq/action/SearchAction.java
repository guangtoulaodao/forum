package com.yxq.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.yxq.actionform.SearchForm;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class SearchAction extends MySuperAction {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.setParams(request);		
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/searchListShow.jsp");		
		
		SearchForm searchform=(SearchForm)form;
		String subsql=searchform.getSubsql();
		String sqlvalue=searchform.getSqlvalue();
		String searchType=searchform.getSearchType();
		
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes")){			//通过“返回”超链接触发的搜索操作
			subsql=(String)session.getAttribute("subsql");
			sqlvalue=(String)session.getAttribute("sqlvalue");
			sqlvalue=(String)session.getAttribute("sqlvalue");
			searchform.setSubsql(subsql);
			searchform.setSqlvalue(sqlvalue);
			searchform.setSearchType(searchType);
		}
		else{																		//通过提交表单触发的“搜索操作”
			session.setAttribute("subsql",subsql);
			sqlvalue=Change.HTMLChange(searchform.getSqlvalue());
			session.setAttribute("sqlvalue",sqlvalue);
			session.setAttribute("searchType",searchType);
		}
		
		String opname="";
		String param="";
		if(searchType.equals("all")){
			opname=" = ";
			param=sqlvalue;			
		}
		else{
			opname=" like ";
			param="%"+sqlvalue+"%";
		}
		
		int perR=5;
		String currentP=request.getParameter("showpage");
		if(currentP==null||currentP.equals(""))
			currentP=(String)session.getAttribute("currentPsh");
		else
			session.setAttribute("currentPsh",currentP);
		String gowhich="user/search.do";	
		
		OpDB myOp=new OpDB();
		myOp.setMark(true);								//进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich);		//设置进行分页显示需要的信息		
		
		String sql="select * from tb_bbs where "+subsql+opname+"?";
		Object[] params={param};		

		List searchlist=myOp.OpBbsListShow(sql,params);
		CreatePage page=myOp.getPage();
		
		session.setAttribute("searchlist",searchlist);
		session.setAttribute("page",page);
		
		return mapping.findForward("success");
	}
}

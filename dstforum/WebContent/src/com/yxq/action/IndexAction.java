package com.yxq.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.LabelValueBean;

import com.yxq.actionform.ClassForm;
import com.yxq.dao.OpDB;

public class IndexAction extends Action {
	private static Vector searchSQL=null;	
	private static Vector headFace=null;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();		
		session.setAttribute("mainPage","default.jsp");
		session.setAttribute("backMainPage","default.jsp");
		OpDB myOp=new OpDB();
		
		List classType=myOp.OpClassListShow();
		if(classType!=null&&classType.size()!=0){
			for(int i=0;i<classType.size();i++){
				String classID=((ClassForm)classType.get(i)).getClassId();
				String sql="select * from tb_board where board_classID=?";
				Object[] params={classID};
				List oneboardlist=myOp.OpBoardListShow(sql,params);
				session.setAttribute("class"+classID,oneboardlist);				
			}
		}
		session.setAttribute("classType",classType);		
		session.setAttribute("searchSQL",searchSQL);
		session.setAttribute("headFace",headFace);
		return (mapping.findForward("success"));
	}
	
	static{
		searchSQL=new Vector();
		searchSQL.add(new LabelValueBean("帖子标题","bbs_title"));
		searchSQL.add(new LabelValueBean("帖子内容","bbs_content"));
		searchSQL.add(new LabelValueBean("发表者","bbs_sender"));		
		
		headFace=new Vector();
		for(int i=0;i<22;i++){
			String gif="user"+i+".gif";
			headFace.add(new LabelValueBean("头像"+(i+1),gif));			
		}		
	}
}

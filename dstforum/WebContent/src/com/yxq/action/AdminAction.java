package com.yxq.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;

import com.yxq.actionform.AbleForm;
import com.yxq.actionform.BoardForm;
import com.yxq.actionform.ClassForm;
import com.yxq.actionform.UserForm;
import com.yxq.dao.OpDB;
import com.yxq.tools.Change;

public class AdminAction extends DispatchAction {	
	
	/** �ö����� */
    public ActionForward setTopBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/openRootShow.jsp");
		String forwardPath="error";		
		
		String bbsId=request.getParameter("bbsId");
		if(bbsId!=null&&!bbsId.equals("")){
			Date date=new Date();
			String today=Change.dateTimeChange(date);
			String sql="update tb_bbs set bbs_isTop='1', bbs_toTopTime=? where bbs_id=?";
			Object[] params={today,bbsId};
			
			ActionMessages messages=new ActionMessages();
			
			OpDB myOp=new OpDB();
			int i=myOp.OpUpdate(sql, params);
			if(i<=0){
				System.out.println("�ö����ӳ���");
				forwardPath="error";
				messages.add("userOpR",new ActionMessage("luntan.bbs.top.E"));
			}
			else{
				System.out.println("�ö����ӳɹ���");
				forwardPath="success";
				messages.add("userOpR",new ActionMessage("luntan.bbs.top.S"));
			}			
			saveErrors(request,messages);
		}
		return mapping.findForward(forwardPath);
	}
    
    /** ��Ϊ�������� */
    public ActionForward setGoodBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		String forwardPath="error";		
		
		String bbsId=request.getParameter("bbsId");
		if(bbsId!=null&&!bbsId.equals("")){
			Date date=new Date();
			String today=Change.dateTimeChange(date);
			String sql="update tb_bbs set bbs_isGood='1', bbs_toTopTime=? where bbs_id=?";
			Object[] params={today,bbsId};
			
			ActionMessages messages=new ActionMessages();
			
			OpDB myOp=new OpDB();
			int i=myOp.OpUpdate(sql, params);
			if(i<=0){
				System.out.println("��Ϊ��������ʧ�ܣ�");
				forwardPath="error";
				messages.add("userOpR",new ActionMessage("luntan.bbs.good.E"));
			}
			else{
				System.out.println("��Ϊ�������ӳɹ���");
				forwardPath="success";
				messages.add("userOpR",new ActionMessage("luntan.bbs.good.S"));
			}			
			saveErrors(request,messages);
		}
		return mapping.findForward(forwardPath);
	}
    
    /** ɾ���ظ��� */
    public ActionForward deleteAnswerBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		String forwardPath="error";
    	
    	String delbbsId=request.getParameter("delbbsAnswerId");
    	if(delbbsId!=null&&!delbbsId.equals("")){
    		String sql="delete from tb_bbsAnswer where bbsAnswer_id=?";
    		Object[] params={delbbsId};
    		
    		ActionMessages messages=new ActionMessages();
    		
    		OpDB myOp=new OpDB();
    		int i=myOp.OpUpdate(sql, params);
    		if(i<=0){
    			System.out.println("ɾ���ظ���ʧ�ܣ�");
    			forwardPath="error";
    			messages.add("userOpR",new ActionMessage("luntan.bbs.deleteAnswerR.E"));
    		}
    		else{
    			System.out.println("ɾ���ظ����ɹ���");
    			forwardPath="success";
    			messages.add("userOpR",new ActionMessage("luntan.bbs.deleteAnswerR.S"));    		
    		}
    		saveErrors(request,messages);    		
    	}
		return mapping.findForward(forwardPath);
    }
    
    /** ��̨-�б�鿴��̳��� */
    public ActionForward getClassList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../class/classListShow.jsp");
    	
    	OpDB myOp=new OpDB();		
		List classList=myOp.OpClassListShow();
		session.setAttribute("backClassList",classList);
    	return mapping.findForward("success");
    }

    /** ��̨-�޸���̳��� */
    public ActionForward modifyClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){    	
		HttpSession session=request.getSession();
		session.setAttribute("backMainPage","../class/classModify.jsp");
		
		String forwardPath="";
    	String classId=request.getParameter("classId");
    	if(classId==null)
    		classId="";
		
    	OpDB myOp=new OpDB();    	
    	ClassForm classForm=(ClassForm)form;
    	String validate=request.getParameter("validate");    	
    	if(validate==null||validate.equals("")||!validate.equals("yes")){
    		forwardPath="showModifyJSP";
    		String sql="select * from tb_class where class_id=?";
    		Object[] params={classId};
    		
    		ClassForm classSingle=myOp.OpClassSingleShow(sql, params);
    		classForm.setClassId(classSingle.getClassId());
    		classForm.setClassName(classSingle.getClassName());
    		classForm.setClassIntro(classSingle.getClassIntro()); 
    	}
    	else{
    		ActionMessages messages=new ActionMessages();
    		classId	= classForm.getClassId();
    		String 	className=Change.HTMLChange(classForm.getClassName());
    		String 	classIntro=Change.HTMLChange(classForm.getClassIntro());
    		
    		String sql="update tb_class set class_name=?,class_intro=? where class_id=?";
    		Object[] paramsMo={className,classIntro,classId};
    		int i=myOp.OpUpdate(sql, paramsMo);
    		if(i<=0){
    			System.out.println("������̳���ʧ�ܣ�");
    			forwardPath="error";
    			messages.add("adminOpR",new ActionMessage("luntan.admin.modify.class.E"));
    		}
    		else{
    			System.out.println("������̳���ɹ���");
    			session.setAttribute("backMainPage","../class/classListShow.jsp");
    			forwardPath="success";
    			messages.add("adminOpR",new ActionMessage("luntan.admin.modify.class.S"));
    		}
    		saveErrors(request,messages); 
    	}    	
    	return mapping.findForward(forwardPath);
    }
    
    /** ��̨-�����̳��� */
    public ActionForward addClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../class/classAdd.jsp");
    	
    	String validate=request.getParameter("validate");
    	if(validate==null||validate.equals("")||!validate.equals("yes")){
    		return mapping.findForward("result");
    	}
    	else{
    		ActionMessages messages=new ActionMessages();
    		ClassForm classForm=(ClassForm)form;
    		
    		String className=Change.HTMLChange(classForm.getClassName());
    		String classIntro=Change.HTMLChange(classForm.getClassIntro());
    		
    		String sql="";
    		Object[] params=null;
    		OpDB myOp=new OpDB();
    		
    		sql="select * from tb_class where class_name=?";
    		params=new Object[1];
    		params[0]=className;
    		
    		if(myOp.OpClassSingleShow(sql, params)!=null){
    			System.out.println("�����̳���-���ƣ�"+className+" ����̳�Ѿ����ڣ�");
    			messages.add("adminOpR",new ActionMessage("luntan.admin.add.class.exist",className));
    		}
    		else{
    			sql="insert into tb_class values(?,?)";
    			params=new Object[2];
    			params[0]=className;
    			params[1]=classIntro;
    			
    			int i=myOp.OpUpdate(sql, params);
    			if(i<=0){
    				System.out.println("�����̳���ʧ�ܣ�");
    				messages.add("adminOpR",new ActionMessage("luntan.admin.add.class.E"));
    			}
    			else{
    				System.out.println("�����̳���ɹ���");
    				classForm.clear();
    				messages.add("adminOpR",new ActionMessage("luntan.admin.add.class.S"));
    			}
    		}
    		saveErrors(request,messages);    		
    		return mapping.findForward("result");
    	}    	
    }
    
    /** ��̨-ɾ����̳��� */
    public ActionForward deleteClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){    	
    	String classId=request.getParameter("classId");
    	if(classId==null||classId.equals(""))
    		classId="-1";
    	String sql="delete tb_class where class_id=?";
    	Object[] params={classId};
    	
    	OpDB myOp=new OpDB();
    	int i=myOp.OpUpdate(sql, params);
    	
    	ActionMessages messages=new ActionMessages();
    	String forwardPath="";
    	
    	if(i<=0){
    		System.out.println("ɾ����̳���ʧ�ܣ�");
    		forwardPath="error";
    		messages.add("adminOpR",new ActionMessage("luntan.admin.delete.class.E"));
    	}
    	else{
    		System.out.println("ɾ����̳���ɹ���");
    		forwardPath="success";
    		messages.add("adminOpR",new ActionMessage("luntan.admin.delete.class.S"));
    	}
    	saveErrors(request,messages);
    	return mapping.findForward(forwardPath);
    }
    
    /** ��̨-�б�鿴���� */
    public ActionForward getBoardList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){    	
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../board/boardListShow.jsp");

    	List boardList=null;
    	OpDB myOp=new OpDB();    	
    	String getType=request.getParameter("type");
    	
    	if(getType==null||getType.equals("")||!getType.equals("show")){
    		List classList=myOp.OpClassListShow();
    		session.setAttribute("backClassList",classList);    		
    	}    	
    	else{    		
    		ClassForm classform=(ClassForm)form;
    		String classId=classform.getClassId();
    		
    		if(classId==null||classId.equals("")){
    			classId=(String)session.getAttribute("boardListId");
    			classform.setClassId(classId);
    		}
    		else{
    			session.setAttribute("boardListId",classId);
    		}
    		
    		String sql="select * from tb_board where board_classID=?";
    		Object[] params={classId};		
    		boardList=myOp.OpBoardListShow(sql,params);
    	}
    	session.setAttribute("backBoardList",boardList);    		
    	return mapping.findForward("success");
    }
    
    /** ��̨-�޸İ��� */
    public ActionForward modifyBoard(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../board/boardModify.jsp");
    	
    	OpDB myOp=new OpDB();
    	List classList=myOp.OpClassListShow();
    	session.setAttribute("backClassList",classList);
    	
		String forwardPath="";
		String boardId=request.getParameter("boardId");
		if(boardId==null)
			boardId="";
		
		BoardForm boardForm=(BoardForm)form;
    	String validate=request.getParameter("validate");
    	if(validate==null||validate.equals("")||!validate.equals("yes")){
    		forwardPath="showModifyJSP";    		
    		String sql="select * from tb_board where board_id=?";
    		Object[] params={boardId};    		
    		BoardForm select=myOp.OpBoardSingleShow(sql, params); 
    		
    		boardForm.setBoardId(select.getBoardId());
    		boardForm.setBoardClassID(select.getBoardClassID());
    		boardForm.setBoardName(select.getBoardName());
    		boardForm.setBoardMaster(select.getBoardMaster());
    		boardForm.setBoardPcard(select.getBoardPcard());
    	}
    	else{    		
    		ActionMessages messages=new ActionMessages();    		

    		String 	boardClassId=boardForm.getBoardClassID();
    		boardId = boardForm.getBoardId();
    		String 	boardName=Change.HTMLChange(boardForm.getBoardName());
    		String 	boardMaster=Change.HTMLChange(boardForm.getBoardMaster());
    		String 	boardPcard=Change.HTMLChange(boardForm.getBoardPcard());    	
    		
    		String sql="select * from tb_user where user_name=?";
    		Object[] paramsS={boardMaster};
    		
    		UserForm userform=myOp.OpUserSingleShow(sql, paramsS);
    		if(userform==null){
    			forwardPath="error";
    			System.out.println("�޸İ���-"+boardMaster+" ���������ڣ�");
    			messages.add("adminOpR",new ActionMessage("luntan.admin.update.board.no.user",boardMaster));
    		}
    		else if(userform.getUserAble().equals("0")){
    			forwardPath="error";
    			System.out.println("�޸İ���-"+boardMaster+"���ǰ�����");
    			messages.add("adminOpR",new ActionMessage("luntan.admin.update.board.user.able",boardMaster));
    		}
    		else{
    			sql="update tb_board set board_classID=?,board_name=?,board_master=?,board_pcard=? where board_id=?";
    			Object[] paramsM={boardClassId,boardName,boardMaster,boardPcard,boardId};
    			
    			int i=myOp.OpUpdate(sql, paramsM);
    			if(i<=0){
    				forwardPath="error";
    				System.out.println("���°���ʧ�ܣ�");
    				messages.add("adminOpR",new ActionMessage("luntan.admin.modify.board.E"));
    			}
    			else{
    				forwardPath="success";
    				System.out.println("���°���ɹ���");
    				messages.add("adminOpR",new ActionMessage("luntan.admin.modify.board.S"));
    			}			
    		}
    		saveErrors(request,messages); 		
    	}
    	return mapping.findForward(forwardPath);    		
    }
    
    /** ��̨-��Ӱ��� */
    public ActionForward addBoard(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../board/boardAdd.jsp");

    	OpDB myOp=new OpDB();
    	
    	String validate=request.getParameter("validate");
    	if(validate==null||validate.equals("")||!validate.equals("yes")){
    		List classList=myOp.OpClassListShow();
    		session.setAttribute("backClassList",classList);
    		return mapping.findForward("result");
    	}
    	else{
    		BoardForm boardform=(BoardForm)form;
    		String classId=boardform.getBoardClassID();
    		String boardName=Change.HTMLChange(boardform.getBoardName());
    		String boardMaster=Change.HTMLChange(boardform.getBoardMaster());
    		String boardPcard=Change.HTMLChange(boardform.getBoardPcard());
    		
    		ActionMessages messages=new ActionMessages();    		
    		String sql="select * from tb_board where board_name=? and board_classID=?";
    		Object[] params={boardName,classId};
    		
    		if(myOp.OpBoardSingleShow(sql, params)!=null){
    			System.out.println("��Ӱ���- "+boardName+" �����Ѿ����ڣ�");
    			messages.add("adminOpR",new ActionMessage("luntan.admin.add.board.exist",boardName));
    		}
    		else{
    			sql="select * from tb_user where user_name=?";
    			Object[] params1={boardMaster};
    			
    			UserForm userform=myOp.OpUserSingleShow(sql, params1);
    			if(userform==null){
    				System.out.println("��Ӱ���-"+boardMaster+" ���������ڣ�");
    				messages.add("adminOpR",new ActionMessage("luntan.admin.update.board.no.user",boardMaster));
    			}
    			else if(userform.getUserAble().equals("0")){
    				System.out.println("��Ӱ���-"+boardMaster+" ���ǰ�����");
    				messages.add("adminOpR",new ActionMessage("luntan.admin.update.board.user.able",boardMaster));
    			}
    			else{
    				sql="insert into tb_board values(?,?,?,?)";
    				Object[] params2={classId,boardName,boardMaster,boardPcard};
    				
    				int i=myOp.OpUpdate(sql, params2);
    				if(i<=0){
    					System.out.println("��Ӱ���ʧ�ܣ�");
    					messages.add("adminOpR",new ActionMessage("luntan.admin.add.board.E"));
    				}
    				else{
    					boardform.clear();
    					System.out.println("��Ӱ���ɹ���");
    					messages.add("adminOpR",new ActionMessage("luntan.admin.add.board.S"));
    				}    			
    			}    			
    		}    		
    		saveErrors(request,messages);
    		return mapping.findForward("result");
    	}
    }
    
    /** ��̨-ɾ������ */
    public ActionForward deleteBoard(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	String boardId=request.getParameter("boardId");
    	if(boardId==null||boardId.equals(""))
    		boardId="-1";
    	String sql="delete tb_board where board_id=?";
    	Object[] params={boardId};
    	
    	OpDB myOp=new OpDB();
    	int i=myOp.OpUpdate(sql, params);
    	
    	ActionMessages messages=new ActionMessages();
    	String forwardPath="";
    	
    	if(i<=0){
    		System.out.println("ɾ������ʧ�ܣ�");
    		forwardPath="error";
    		messages.add("adminOpR",new ActionMessage("luntan.admin.delete.board.E"));
    	}
    	else{
    		System.out.println("ɾ������ɹ���");
    		forwardPath="success";
    		messages.add("adminOpR",new ActionMessage("luntan.admin.delete.board.S"));
    	}
    	saveErrors(request,messages);
    	return mapping.findForward(forwardPath);
    }
    
    /** ��̨-�б�鿴�û� */
    public ActionForward getUserList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../user/userListShow.jsp");    	
    	
    	String getType=request.getParameter("type");
    	if(getType==null||getType.equals("")||!getType.equals("show")){
    		List ableList=new ArrayList();
    		ableList.add(new LabelValueBean("ȫ��","all"));
    		ableList.add(new LabelValueBean("����Ա","2"));
    		ableList.add(new LabelValueBean("����","1"));
    		ableList.add(new LabelValueBean("��ͨ�û�","0"));
    		session.setAttribute("backListAble",ableList);    		
    	}
    	else{
    		AbleForm ableform=(AbleForm)form;
    		String able=ableform.getShowAble();
    		
    		if(able==null||able.equals("")){
    			able=(String)session.getAttribute("userAble");
    			ableform.setShowAble(able);
    		}
    		else
    			session.setAttribute("userAble",able);
    		
    		String sql="";
    		Object[] params=null;
    		if(able.equals("all")){
    			sql="select * from tb_user order by user_able DESC";
    		}
    		else{
    			sql="select * from tb_user where user_able=?";
    			params=new Object[1];
    			params[0]=able;    			                  
    		}
    		
    		OpDB myOp=new OpDB();
    		List userlist=myOp.OpUserListShow(sql, params);
    		request.setAttribute("backUserList",userlist);
    	}    	
    	return mapping.findForward("success");    	
    }
    
    /** ��̨-�޸��û� */
    public ActionForward modifyUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	HttpSession session=request.getSession();
    	session.setAttribute("backMainPage","../user/userModify.jsp");
    	
    	List backUserAble=new ArrayList();    	
    	backUserAble.add(new LabelValueBean("����Ա","2"));
    	backUserAble.add(new LabelValueBean("����","1"));
    	backUserAble.add(new LabelValueBean("��ͨ�û�","0"));
    	session.setAttribute("backUserAble",backUserAble);    		

		String forwardPath="";		
		String userId=request.getParameter("userId");
		if(userId==null)
			userId="";
    	
		UserForm userForm=(UserForm)form;
    	String validate=request.getParameter("validate");
    	if(validate==null||validate.equals("")||!validate.equals("yes")){        	
    		forwardPath="showModifyJSP";    		
    		String sql="select * from tb_user where id=?";
        	Object[] params={userId};
        	
        	OpDB myOp=new OpDB();
        	UserForm select=myOp.OpUserSingleShow(sql, params);
        	
        	userForm.setId(select.getId());
        	userForm.setUserName(select.getUserName());
        	userForm.setOldPassword(select.getOldPassword()); 
        	userForm.setUserFace(select.getUserFace());
        	userForm.setUserSex(select.getUserSex());
        	userForm.setUserPhone(select.getUserPhone());
        	userForm.setUserOICQ(select.getUserOICQ());
        	userForm.setUserEmail(select.getUserEmail());
        	userForm.setUserFrom(select.getUserFrom());
        	userForm.setUserAble(select.getUserAble());        	
    	}
    	else{    		
    		ActionMessages messages=new ActionMessages();
    		
    		userId = userForm.getId();
    		String userName=Change.HTMLChange(userForm.getUserName());
    		String userPassword=Change.HTMLChange(userForm.getUserPassword());    	
    		String userFace=userForm.getUserFace();
    		String userSex=userForm.getUserSex();
    		String userPhone=userForm.getUserPhone();
    		String userOICQ=userForm.getUserOICQ();
    		String userEmail=userForm.getUserEmail();
    		String userFrom=Change.HTMLChange(userForm.getUserFrom());
    		String userAble=userForm.getUserAble();
    		
    		String sql="update tb_user set user_name=?,user_password=?,user_face=?,user_sex=?,user_phone=?,user_OICQ=?,user_email=?,user_from=?,user_able=? where id=?";
    		Object[] params={userName,userPassword,userFace,userSex,userPhone,userOICQ,userEmail,userFrom,userAble,userId};
    		
    		OpDB myOp=new OpDB();
    		int i=myOp.OpUpdate(sql, params);    		

    		if(i<=0){
    			System.out.println("�����û�ʧ�ܣ�");
    			forwardPath="error";
    			messages.add("adminOpR",new ActionMessage("luntan.admin.modify.user.E"));
    		}
    		else{
    			System.out.println("�����û��ɹ���");
    			forwardPath="success";
    			messages.add("adminOpR",new ActionMessage("luntan.admin.modify.user.S"));
    		}
    		saveErrors(request,messages);
    	}
    	return mapping.findForward(forwardPath);
    }
    
    /** ��̨-ɾ���û� */
    public ActionForward deleteUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	String userId=request.getParameter("userId");
    	if(userId==null||userId.equals(""))
    		userId="-1";
    	String sql="delete tb_user where id=?";
    	Object[] params={userId};
    	
    	OpDB myOp=new OpDB();
    	int i=myOp.OpUpdate(sql, params);
    	
    	ActionMessages messages=new ActionMessages();
    	String forwardPath="";
    	
    	if(i<=0){
    		System.out.println("ɾ���û�ʧ�ܣ�");
    		forwardPath="error";
    		messages.add("adminOpR",new ActionMessage("luntan.amdin.delete.user.E"));
    	}
    	else{
    		System.out.println("ɾ���û��ɹ���");
    		forwardPath="success";
    		messages.add("adminOpR",new ActionMessage("luntan.amdin.delete.user.S"));
    	}
    	saveErrors(request,messages);
    	return mapping.findForward(forwardPath);
    }
 }

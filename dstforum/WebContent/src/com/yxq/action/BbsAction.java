package com.yxq.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.util.LabelValueBean;

import com.yxq.actionform.BbsAnswerForm;
import com.yxq.actionform.BbsForm;
import com.yxq.actionform.BoardForm;
import com.yxq.actionform.UserForm;
import com.yxq.dao.OpDB;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class BbsAction extends MySuperAction {
	
	/** ��ʾָ�������е����и��� */
	public ActionForward rootListShow(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){		
		super.setParams(request);
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/listRootShow.jsp");
		
		String classId=request.getParameter("classId");
		String boardId=request.getParameter("boardId");
		if(classId==null||classId.equals(""))
			classId=(String)session.getAttribute("classId");
		else
			session.setAttribute("classId",classId);			
		if(boardId==null||boardId.equals(""))
			boardId=(String)session.getAttribute("boardId");
		else
			session.setAttribute("boardId",boardId);		
		
		/* ���ɡ���ת���桱�����б��е�ѡ���Щѡ��ӦΪ��ǰ��̳����еİ��� */
		Vector<LabelValueBean> jumpBoard=new Vector<LabelValueBean>();		
		List boardlist=(ArrayList)session.getAttribute("class"+classId);
		if(boardlist!=null&&boardlist.size()!=0){			
			for(int i=0;i<boardlist.size();i++){
				BoardForm boardSingle=(BoardForm)boardlist.get(i);
				jumpBoard.add(new LabelValueBean(boardSingle.getBoardName(),boardSingle.getBoardId()));
				if(boardId.equals(boardSingle.getBoardId())){								//����ǵ�ǰ����
					session.setAttribute("boardMaster",boardSingle.getBoardMaster());		//���浱ǰ����İ���
					session.setAttribute("boardPcard",boardSingle.getBoardPcard());			//���浱ǰ����Ĺ���
				}
			}
		}
		session.setAttribute("jumpBoard",jumpBoard);
		
		String sql="";
		Object[] params={boardId};
		OpDB myOp=new OpDB();
		
		/* ��ѯ���ݿ⣬��ȡ�ö�����(����������������) */
		myOp.setMark(false);							//�����з�ҳ��ʾ
		sql="select * from tb_bbs where bbs_boardID=? and bbs_isTop='1' order by bbs_toTopTime DESC";
		List topbbslist=myOp.OpBbsListShow(sql, params);
		session.setAttribute("topbbslist",topbbslist);
		
		/* ��ѯ���ݿ⣬��ȡ��������(�����������ӣ�Ҳ���������ö������Ǿ���������) */
		int perR=5;
		String currentP=request.getParameter("showpage");
		if(currentP==null||currentP.equals(""))
			currentP=(String)session.getAttribute("currentP");
		else
			session.setAttribute("currentP",currentP);
		String gowhich="user/listShow.do?method=rootListShow";	
		
		myOp.setMark(true);								//���з�ҳ��ʾ
		myOp.setPageInfo(perR, currentP, gowhich);		//���ý��з�ҳ��ʾ��Ҫ����Ϣ		
		
		sql="select * from tb_bbs where bbs_boardID=? and (bbs_isTop='0' or bbs_isGood='1') order by bbs_opTime DESC";
		List otherbbslist=myOp.OpBbsListShow(sql, params);		
		CreatePage page=myOp.getPage();
		
		session.setAttribute("otherbbslist",otherbbslist);
		session.setAttribute("page",page);
		
		return mapping.findForward("success");
	}
	
	/** �鿴ĳ������ */
	public ActionForward openShow(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){		
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/openRootShow.jsp");
		
		String bbsId=request.getParameter("bbsId");
		if(bbsId==null||bbsId.equals(""))
			bbsId=(String)session.getAttribute("bbsId");
		else
			session.setAttribute("bbsId",bbsId);
		
		String sql="";
		Object[] params={bbsId};
		OpDB myOp=new OpDB();
		
		/*********** ��ѯtb_bbs���ݱ���ȡҪ�鿴�ĸ��� ***********/
		sql="select * from tb_bbs where bbs_id=?";
		BbsForm bbsRootSingle=myOp.OpBbsSingleShow(sql, params);
		session.setAttribute("bbsRootSingle",bbsRootSingle);
		
		/* ��ѯtb_user���ݱ���ȡ�ø�����������Ϣ */
		String asker=bbsRootSingle.getBbsSender();
		sql="select * from tb_user where user_name=?";
		params[0]=asker;
		UserForm askUser=myOp.OpUserSingleShow(sql, params);
		session.setAttribute("askUser",askUser);		
		
		/* ��ȡ���з�ҳ��ʾ��Ҫ����Ϣ */
		int perR=6;
		String currentP=request.getParameter("showpage");
		if(currentP==null||currentP.equals(""))
			currentP=(String)session.getAttribute("currentPopen");
		else
			session.setAttribute("currentPopen",currentP);
		String gowhich="user/openShow.do?method=openShow";	
		
		myOp.setMark(true);								//���з�ҳ��ʾ
		myOp.setPageInfo(perR, currentP, gowhich);		//���ý��з�ҳ��ʾ��Ҫ����Ϣ
		
		/*********** ��ѯtb_bbsAnswer���ݱ���ȡ�����Ļظ��� ***********/
		sql="select * from tb_bbsAnswer where bbsAnswer_rootID=? order by bbsAnswer_sendTime";
		params[0]=bbsId;
		List answerbbslist=myOp.OpBbsAnswerListShow(sql, params);
		CreatePage page=myOp.getPage();
		
		session.setAttribute("answerbbslist",answerbbslist);		
		session.setAttribute("page",page);
		
		/* ��ѯtb_user���ݱ���ȡ��ǰ�ظ�����������Ϣ */
		sql="select * from tb_user where user_name=?";
		Map answerMap=new HashMap();
		for(int i=0;i<answerbbslist.size();i++){			
			String answerer=((BbsAnswerForm)answerbbslist.get(i)).getBbsAnswerSender();
			if(!answerMap.containsKey(answerer)){
				params[0]=answerer;
				UserForm answerUser=myOp.OpUserSingleShow(sql, params);
				answerMap.put(answerer,answerUser);				
			}
		}
		session.setAttribute("answerMap",answerMap);
	
		return mapping.findForward("success");
	}
	
	/** �鿴������ */
	public ActionForward goodListShow(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		super.setParams(request);
		HttpSession session=request.getSession();
		session.setAttribute("mainPage","/pages/show/bbs/goodListShow.jsp");
		OpDB myOp=new OpDB();
		
		int perR=5;
		String currentP=request.getParameter("showpage");
		if(currentP==null||currentP.equals(""))
			currentP=(String)session.getAttribute("currentPgood");
		else
			session.setAttribute("currentPgood",currentP);
		String gowhich="user/goodListShow.do?method=goodListShow";	
		
		myOp.setMark(true);								//���з�ҳ��ʾ
		myOp.setPageInfo(perR, currentP, gowhich);		//���ý��з�ҳ��ʾ��Ҫ����Ϣ		
		
		String sql="select * from tb_bbs where bbs_isGood='1' order by bbs_toGoodTime DESC";
		List goodlist=myOp.OpBbsListShow(sql,null);
		CreatePage page=myOp.getPage();
		
		session.setAttribute("goodlist",goodlist);
		session.setAttribute("page",page);
		
		return mapping.findForward("success");
	}
	
	/** �������� */
	public ActionForward addBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();		
		session.setAttribute("mainPage","/pages/add/bbsAdd.jsp");
		
		String validate=request.getParameter("validate");
		if(validate==null||validate.equals("")||!validate.equals("yes")){
			return mapping.findForward("showAddJSP");
		}
		else{			
			BbsForm bbsForm=(BbsForm)form;
			
			String	boardId=(String)session.getAttribute("boardId");
			String 	bbsTitle=Change.HTMLChange(bbsForm.getBbsTitle());
			String 	bbsContent=Change.HTMLChange(bbsForm.getBbsContent());
			String 	bbsSender=((UserForm)session.getAttribute("logoner")).getUserName();
			String 	bbsSendTime=Change.dateTimeChange(new Date());
			String 	bbsFace=bbsForm.getBbsFace();
			String 	bbsOpTime=bbsSendTime;
			String 	bbsIsTop="0";
			String 	bbsToTopTime="";
			String 	bbsIsGood="0";
			String 	bbsToGoodTime="";
			
			String sql="insert into tb_bbs values(?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params={boardId,bbsTitle,bbsContent,bbsSender,bbsSendTime,bbsFace,bbsOpTime,bbsIsTop,bbsToTopTime,bbsIsGood,bbsToGoodTime};
			
			ActionMessages messages=new ActionMessages();			
			OpDB myOp=new OpDB();
			int i=myOp.OpUpdate(sql,params);
			if(i<=0){
				System.out.println("��������ʧ�ܣ�");
				messages.add("userOpR",new ActionMessage("luntan.bbs.add.E"));
				saveErrors(request,messages);
				return mapping.findForward("error");				
			}
			else{
				System.out.println("�������ӳɹ���");
				session.setAttribute("currentP","1");
				messages.add("userOpR",new ActionMessage("luntan.bbs.add.S"));
				bbsForm.clear();
				saveErrors(request,messages);
				return mapping.findForward("success");
			}			
		}	
	}
	
	/** �ظ����� */
	public ActionForward answerBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();		
		BbsAnswerForm bbsAnswerForm=(BbsAnswerForm)form;
		
		String  rootId=(String)session.getAttribute("bbsId");		
		String 	bbsTitle=Change.HTMLChange(bbsAnswerForm.getBbsAnswerTitle());
		String 	bbsContent=Change.HTMLChange(bbsAnswerForm.getBbsAnswerContent());
		String 	bbsSender=((UserForm)session.getAttribute("logoner")).getUserName();
		String 	bbsSendTime=Change.dateTimeChange(new Date());
		String 	bbsFace=bbsAnswerForm.getBbsFace();		
		
		String sql="insert into tb_bbsAnswer values(?,?,?,?,?,?)";
		Object[] params=new Object[6];
		
		params[0]=rootId;
		params[1]=bbsTitle;
		params[2]=bbsContent;
		params[3]=bbsSender;
		params[4]=bbsSendTime;
		params[5]=bbsFace;
		
		ActionMessages messages=new ActionMessages();
		String forwardPath="";
		
		OpDB myOp=new OpDB();
		int i=myOp.OpUpdate(sql, params);
		if(i<=0){
			System.out.println("�ظ�����ʧ�ܣ�");
			forwardPath="error";
			messages.add("userOpR",new ActionMessage("luntan.bbs.answerR.E"));
		}
		else{
			System.out.println("�ظ����ӳɹ���");
			forwardPath="success";
			messages.add("userOpR",new ActionMessage("luntan.bbs.answerR.S"));			
			bbsAnswerForm.clear();			
		}		
		saveErrors(request,messages);
		return mapping.findForward(forwardPath);
	}
	
	/** ��������ǰ
	 *  @throws UnsupportedEncodingException */
	public ActionForward toFirstBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		HttpSession session=request.getSession();			
		UserForm logoner=(UserForm)session.getAttribute("logoner");		
		
		String bbsId=request.getParameter("bbsId");						//��ȡ����ǰ���ӵ�ID
		String bbsSender=request.getParameter("bbsSender");				//��ȡ����ǰ���ӵķ�����
		bbsSender=new String(bbsSender.getBytes("ISO-8859-1"));	
		String time=Change.dateTimeChange(new Date());					//��ȡ����ʱ��
		String lognerAble=logoner.getUserAble();						//��ȡ��ǰ��¼�û���Ȩ��
		String lognerName=logoner.getUserName();						//��ȡ��ǰ��¼�û����û���
		String master=(String)session.getAttribute("boardMaster");		//��ȡ��ǰ����İ���		
		
		if(bbsId==null)
			bbsId="-1";
		if(bbsSender==null)
			bbsSender="";	
		
		String forwardPath="";
		ActionMessages messages=new ActionMessages();
		
		/* �����ǰ��¼���û������ӵķ����ߡ�������������İ��񡢹���Ա */		
		if(lognerAble.equals("2")||lognerName.equals(master)||lognerName.equals(bbsSender)){
			if(bbsId!=null&&!bbsId.equals("")){
				Object[] params={time,bbsId};
				String sql="update tb_bbs set bbs_opTime=? where bbs_id=?";
				OpDB myOp=new OpDB();
				int i=myOp.OpUpdate(sql,params);
				if(i<=0){
					System.out.println("��ǰ����ʧ��");
					forwardPath="error";
					messages.add("userOpR",new ActionMessage("luntan.bbs.first.E"));					
				}
				else{
					System.out.println("��ǰ���ӳɹ���");
					forwardPath="success";
					messages.add("userOpR",new ActionMessage("luntan.bbs.first.S"));					
				}				
			}
			else{
				forwardPath="error";
			}
		}
		else{
			System.out.println("��û��Ȩ����ǰ�����ӣ�");
			forwardPath="error";
			messages.add("userOpR",new ActionMessage("luntan.bbs.first.N"));
		}
		saveErrors(request,messages);
		return mapping.findForward(forwardPath);
	}
	
	/** ɾ������ 
	 * @throws UnsupportedEncodingException */
	public ActionForward deleteRootBbs(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{		
		HttpSession session=request.getSession();		
		UserForm logoner=(UserForm)session.getAttribute("logoner");
		
		String bbsId=request.getParameter("bbsId");						//��ȡҪɾ�����ӵ�ID	
		String bbsSender=request.getParameter("bbsSender");				//��ȡҪɾ�����ӵķ�����
		bbsSender=new String(bbsSender.getBytes("ISO-8859-1"));
		String lognerAble=logoner.getUserAble();						//��ȡ��ǰ��¼�û���Ȩ��
		String lognerName=logoner.getUserName();						//��ȡ��ǰ��¼�û����û���
		String master=(String)session.getAttribute("boardMaster");		//��ȡ��ǰ����
		
		if(bbsId==null)
			bbsId="-1";
		if(bbsSender==null)
			bbsSender="";		
		
		ActionMessages messages=new ActionMessages();
		
    	//�����ǰ��¼���û������ӵķ����ߡ�������������İ��񡢹���Ա
		if(lognerAble.equals("2")||lognerName.equals(master)||lognerName.equals(bbsSender)){
			if(bbsId!=null&&!bbsId.equals("")){						
				String sql="delete tb_bbs where bbs_id=?";				
				Object[] params={bbsId};
				
				OpDB myOp=new OpDB();
				int i=myOp.OpUpdate(sql,params);
				if(i<=0){
					System.out.println("ɾ������");
					messages.add("userOpR",new ActionMessage("luntan.bbs.deleteRoot.E"));
					saveErrors(request,messages);					
				}
				else{								//ɾ���ɹ���Ҫ�����б���ʾ������ҳ�棬��ҳ���У��鿴ĳ���������и�����ҳ�桢�鿴�ҵ����ӵ�ҳ�桢�鿴�������ӵ�ҳ��
					System.out.println("ɾ���ɹ���");
					messages.add("userOpR",new ActionMessage("luntan.bbs.deleteRoot.S"));
					saveErrors(request,messages);
					ActionForward forward=new ActionForward("/"+session.getAttribute("servletPath")+"?method="+session.getAttribute("method"));		//��Ϊ���ص�ҳ���������������������Է��ص���ͼҪ�ڳ����ж�ָ̬��
					return forward;
				}				
			}
			return mapping.findForward("error");
		}
		else{
			System.out.println("��û��Ȩ��ɾ��������!");			
			messages.add("userOpR",new ActionMessage("luntan.bbs.deleteRoot.N"));
			saveErrors(request,messages);
			return mapping.findForward("error");
		}		
	}
	
	/** �鿴���ӵķ����ߵ���ϸ��Ϣ */
	public ActionForward getUserSingle(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		
		String userName=request.getParameter("userName");
		if(userName==null)
			userName="";		
		try {
			userName=new String(userName.getBytes("ISO-8859-1"),"gb2312");
		} catch (UnsupportedEncodingException e) {
			userName="";
			e.printStackTrace();
		}
		
		ActionMessages messages=new ActionMessages();
		String forwardPath="";
		
		String sql="select * from tb_user where user_name=?";
		Object[] params={userName};
		
		OpDB myOp=new OpDB();
		UserForm bbsUser=myOp.OpUserSingleShow(sql, params);		
		
		if(bbsUser==null){
			System.out.println("�鿴���ӵķ�����ʧ�ܣ�");
			forwardPath="error";
			messages.add("userOpR",new ActionMessage("luntan.bbs.sender.E"));
		}
		else{
			System.out.println("�鿴���ӵķ����߳ɹ���");			
			forwardPath="success";
			session.setAttribute("bbsUserSingle",bbsUser);
			session.setAttribute("mainPage","/pages/show/user/bbsUserSingle.jsp");
		}
		saveErrors(request,messages);
		return mapping.findForward(forwardPath);
	}	
}

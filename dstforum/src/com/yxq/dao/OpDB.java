package com.yxq.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yxq.actionform.BbsAnswerForm;
import com.yxq.actionform.BbsForm;
import com.yxq.actionform.BoardForm;
import com.yxq.actionform.ClassForm;
import com.yxq.actionform.UserForm;
import com.yxq.model.CreatePage;
import com.yxq.tools.Change;

public class OpDB {
	private boolean mark=false;
	private int perR=5;
	private String currentP="1";
	private String gowhich="";
	private CreatePage page=null;
	
	public List<ClassForm> OpClassListShow(){
		List<ClassForm> listshow=null;
		String sql="select * from tb_class";
		DB mydb=new DB();
		mydb.doPstm(sql,null);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			try {
				listshow=new ArrayList<ClassForm>();
				while(rs.next()){
					ClassForm classSingle=new ClassForm();
					classSingle.setClassId(String.valueOf(rs.getInt(1)));
					classSingle.setClassName(rs.getString(2));					
					classSingle.setClassIntro(rs.getString(3));
					listshow.add(classSingle);					
				}
			} catch (SQLException e) {
				System.out.println("调用OpDB类中OpClassListShow()方法出错！");
				e.printStackTrace();
			}
		}
		return listshow;
	}	
	
	public ClassForm OpClassSingleShow(String sql,Object[] params){
		ClassForm classform=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		try {
    		if(rs!=null&&rs.next()){
    			classform=new ClassForm();
    			classform.setClassId(String.valueOf(rs.getInt(1)));
    			classform.setClassName(rs.getString(2));    			
    			classform.setClassIntro(rs.getString(3));
    		}
    		
		} catch (SQLException e) {
			System.out.println("调用OpDB类中OpClassingleShow()方法出错！");
			e.printStackTrace();
		}
		return classform;		
	}
	
	public List OpBoardListShow(String sql,Object[] params){
		List<BoardForm> listshow=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			try {
				listshow=new ArrayList<BoardForm>();
				while(rs.next()){
					BoardForm boardSingle=new BoardForm();
					boardSingle.setBoardId(String.valueOf(rs.getInt(1)));
					boardSingle.setBoardClassID(String.valueOf(rs.getInt(2)));
					boardSingle.setBoardName(rs.getString(3));
					boardSingle.setBoardMaster(rs.getString(4));
					boardSingle.setBoardPcard(rs.getString(5));					
					
					String bbsNum="";
					String undoNum="";
					String goodNum="";
					
					String sql1="";					
					Object[] params1={boardSingle.getBoardId()};
					ResultSet rs1;
					
					//查询该版面中所有的根帖数
					sql1="select count(bbs_id) from tb_bbs where bbs_boardID=?";
					mydb.doPstm(sql1, params1);
					rs1=mydb.getRs();
					if(rs1!=null&&rs1.next()){
						bbsNum=String.valueOf(rs1.getInt(1));						
					}
				
					//查询该版面中所有未处理的根帖数
					sql1="SELECT COUNT(bbs_id) AS num FROM tb_bbs WHERE (bbs_boardID = ?) AND (bbs_id NOT IN (SELECT bbsAnswer_rootID FROM tb_bbsAnswer))";
					mydb.doPstm(sql1, params1);
					rs1=mydb.getRs();
					if(rs1!=null&&rs1.next()){
						undoNum=String.valueOf(rs1.getInt(1));
					}
				
					//查询该版面中所有精华根帖数
					sql1="select count(bbs_id) from tb_bbs where bbs_boardID=? and bbs_isGood='1'";
					mydb.doPstm(sql1, params1);
					rs1=mydb.getRs();
					if(rs1!=null&&rs1.next()){
						goodNum=String.valueOf(rs1.getInt(1));
					}
									
					//设置根帖数、未处理根帖数、精华帖数
					boardSingle.setBoardBbsnum(bbsNum);
					boardSingle.setBoardBbsundonum(undoNum);
					boardSingle.setBoardBbsgoodnum(goodNum);					
					
					listshow.add(boardSingle);					
				}
			} catch (SQLException e) {
				System.out.println("调用OpDB类中OpBoardListShow()方法出错！");
				e.printStackTrace();
			}
		}
		return listshow;
	}
	
	public BoardForm OpBoardSingleShow(String sql,Object[] params){
		BoardForm boardForm=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		try {
    		if(rs!=null&&rs.next()){
    			boardForm=new BoardForm();
    			boardForm.setBoardId(String.valueOf(rs.getInt(1)));
    			boardForm.setBoardClassID(String.valueOf(rs.getInt(2)));
    			boardForm.setBoardName(rs.getString(3));
    			boardForm.setBoardMaster(rs.getString(4));
    			boardForm.setBoardPcard(rs.getString(5));    			
    		}
    		
		} catch (SQLException e) {
			System.out.println("调用OpDB类中OpBoardSingle()方法出错！");
			e.printStackTrace();
		}
		return boardForm;		
	}
	
	public List<BbsForm> OpBbsListShow(String sql,Object[] params){
		ResultSet rs=getRs(sql,params);
		
		List<BbsForm> listshow=null;
		int i=1;
		if(rs!=null){
			listshow=new ArrayList<BbsForm>();
			try {
				while(rs.next()&&(!mark||i<=perR)){					
					BbsForm bbsform=new BbsForm();
					bbsform.setBbsId(String.valueOf(rs.getInt(1)));
					bbsform.setBbsBoardID(String.valueOf(rs.getInt(2)));					
					bbsform.setBbsTitle(rs.getString(3));
					bbsform.setBbsContent(rs.getString(4));
					bbsform.setBbsSender(rs.getString(5));
					bbsform.setBbsSendTime(Change.dateTimeChange(rs.getTimestamp(6)));
					bbsform.setBbsFace(rs.getString(7));
					bbsform.setBbsOpTime(Change.dateTimeChange(rs.getTimestamp(8)));
					bbsform.setBbsIsTop(rs.getString(9));
					bbsform.setBbsToTopTime(Change.dateTimeChange(rs.getTimestamp(10)));
					bbsform.setBbsIsGood(rs.getString(11));
					bbsform.setBbsToGoodTime(Change.dateTimeChange(rs.getTimestamp(12)));					
					
					/* 以下代码，查询tb_bbsAnswer数据表，查询出当前帖子的回复数、最后回复者、最后回复时间 */					
					String bbsId=bbsform.getBbsId();					
					String answerNum="0";
					String lastUpdateUser="";
					String lastUpdateTime="";					
					DB mydb=new DB();
					
					//查询tb_bbsAnswer数据表,获取回复帖子数
					String sql1="select count(bbsAnswer_id) from tb_bbsAnswer where bbsAnswer_rootID=?";					
					Object[] params1={bbsId};					
					
					mydb.doPstm(sql1, params1);
					ResultSet rs1=mydb.getRs();					

					try {
						if(rs1!=null&&rs1.next())
							answerNum=(String.valueOf(rs1.getInt(1)));
					} catch (SQLException e) {
						System.out.println("获取回复帖子数出错！");
						e.printStackTrace();
					}
					
					//查询出该根帖的所有回复帖子(按回复时间升序排列),获取最后回复人、回复时间
					String sql2="select bbsAnswer_sender, bbsAnswer_sendTime from tb_bbsAnswer where bbsAnswer_rootID = ? order by bbsAnswer_sendTime";
					
					mydb.doPstm(sql2, params1);
					ResultSet rs2=mydb.getRs();
					
					try {
						if(rs2!=null&&rs2.next()){
							rs2.last();
							lastUpdateUser=rs2.getString(1);
							lastUpdateTime=Change.dateTimeChange(rs2.getTimestamp(2));
						}
					} catch (SQLException e) {
						System.out.println("获取最后回复人、回复时间出错！");
						e.printStackTrace();
					}
					
					//设置回复帖子数、最后回复人、最后回复时间
					bbsform.setBbsAnswerNum(answerNum);
					bbsform.setBbsLastUpdateUser(lastUpdateUser);
					bbsform.setBbsLastUpdateTime(lastUpdateTime);					
					listshow.add(bbsform);					
					i++;
				}
			} catch (SQLException e) {				
				System.out.println("OpBbsListShow()方法出错！");
				System.out.println("标记："+mark);
				e.printStackTrace();
			}			
		}
		return listshow;
}
	
	public List OpBbsAnswerListShow(String sql,Object[] params){
		ResultSet rs=getRs(sql,params);
		
		List listshow=null;
		if(rs!=null){
			try {				
				listshow=new ArrayList<BbsForm>();
				int i=1;
				while(rs.next()&&(!mark||i<=perR)){					
					BbsAnswerForm bbsAnswerform=new BbsAnswerForm();
					bbsAnswerform.setBbsAnswerId(String.valueOf(rs.getInt(1)));
					bbsAnswerform.setBbsAnswerRootID(String.valueOf(rs.getInt(2)));					
					bbsAnswerform.setBbsAnswerTitle(rs.getString(3));
					bbsAnswerform.setBbsAnswerContent(rs.getString(4));
					bbsAnswerform.setBbsAnswerSender(rs.getString(5));
					bbsAnswerform.setBbsAnswerSendTime(Change.dateTimeChange(rs.getTimestamp(6)));
					bbsAnswerform.setBbsFace(rs.getString(7));					
					listshow.add(bbsAnswerform);
					i++;
				}
			} catch (SQLException e) {
				System.out.println("调用OpDB类中OpBbsAnswerListShow()方法出错！");
				e.printStackTrace();
			}
		}
		return listshow;
	}
	
	public BbsForm OpBbsSingleShow(String sql,Object[] params){
		BbsForm bbsform=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		try {
    		if(rs!=null&&rs.next()){
    			bbsform=new BbsForm();
				bbsform.setBbsId(String.valueOf(rs.getInt(1)));
				bbsform.setBbsBoardID(String.valueOf(rs.getInt(2)));				
				bbsform.setBbsTitle(rs.getString(3));
				bbsform.setBbsContent(rs.getString(4));
				bbsform.setBbsSender(rs.getString(5));
				bbsform.setBbsSendTime(Change.dateTimeChange(rs.getTimestamp(6)));				
				bbsform.setBbsFace(rs.getString(7));
				bbsform.setBbsOpTime(Change.dateTimeChange(rs.getTimestamp(8)));
				bbsform.setBbsIsTop(rs.getString(9));
				bbsform.setBbsToTopTime(Change.dateTimeChange(rs.getTimestamp(10)));
				bbsform.setBbsIsGood(rs.getString(11));
				bbsform.setBbsToGoodTime(Change.dateTimeChange(rs.getTimestamp(12)));				
    		}
    		
		} catch (SQLException e) {
			System.out.println("调用OpDB类中OpBbsingleShow()方法出错！");
			e.printStackTrace();
		}
		return bbsform;		
	}
	
	public BbsAnswerForm OpBbsAnswerSingleShow(String sql,Object[] params){
		BbsAnswerForm bbsAnswerform=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
        try{
        	if(rs!=null&&rs.next()){
        		bbsAnswerform=new BbsAnswerForm();
        		bbsAnswerform.setBbsAnswerId(String.valueOf(rs.getInt(1)));
        		bbsAnswerform.setBbsAnswerRootID(String.valueOf(rs.getInt(2)));					
        		bbsAnswerform.setBbsAnswerTitle(rs.getString(3));
        		bbsAnswerform.setBbsAnswerContent(rs.getString(4));
        		bbsAnswerform.setBbsAnswerSender(rs.getString(5));
        		bbsAnswerform.setBbsAnswerSendTime(Change.dateTimeChange(rs.getTimestamp(6)));
        		bbsAnswerform.setBbsFace(rs.getString(7));					
        	} 
        }catch (SQLException e) {
			System.out.println("调用OpDB类中OpBbsAnswerSingleShow()方法出错！");
			e.printStackTrace();
		}
		return bbsAnswerform;
	}
	
	public List OpUserListShow(String sql,Object[] params){
		List userlist=new ArrayList();
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		try {
			if(rs!=null){
				while(rs.next()){
					UserForm userform=new UserForm();			
					userform.setId(String.valueOf(rs.getInt(1)));
					userform.setUserName(rs.getString(2));
					userform.setOldPassword(rs.getString(3));
					userform.setUserFace(rs.getString(4));
					userform.setUserSex(rs.getString(5));
					userform.setUserPhone(rs.getString(6));
					userform.setUserOICQ(rs.getString(7));
					userform.setUserEmail(rs.getString(8));
					userform.setUserFrom(rs.getString(9));
					userform.setUserAble(rs.getString(10));
					userlist.add(userform);
				}
				rs.close();					
			}
		} catch (SQLException e) {
			System.out.println("调用OpDB类中的OpUserListShow()方法出错！");
			e.printStackTrace();
		}finally{
			mydb.closed();
		}
		return userlist;
	}
	
	public UserForm OpUserSingleShow(String sql,Object[] params){
		DB mydb=new DB();
		UserForm userform=null;
		mydb.doPstm(sql, params);
		ResultSet rs=mydb.getRs();
		try {
			if(rs!=null&&rs.next()){
				userform=new UserForm();			
				userform.setId(String.valueOf(rs.getInt(1)));
				userform.setUserName(rs.getString(2));
				userform.setOldPassword(rs.getString(3));
				userform.setUserFace(rs.getString(4));
				userform.setUserSex(rs.getString(5));
				userform.setUserPhone(rs.getString(6));
				userform.setUserOICQ(rs.getString(7));
				userform.setUserEmail(rs.getString(8));
				userform.setUserFrom(rs.getString(9));
				userform.setUserAble(rs.getString(10));	
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println("调用OpDB类中的OpUserSingleShow()方法出错！");
			e.printStackTrace();
		}finally{
			mydb.closed();
		}
		return userform;
	}
	
	public int OpUpdate(String sql,Object[] params){
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		int i=mydb.getUpdate();
		return i;
	}
	
	public void setMark(boolean mark){
		this.mark=mark;
	}
	
	public void setPageInfo(int perR,String currentP,String gowhich){
		this.perR=perR;
		this.currentP=currentP;
		this.gowhich=gowhich;
	}
	
	public ResultSet getRs(String sql,Object[] params){
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			try {
				if(mark){
					OpCreatePage(rs);
					perR=page.getPerR();
					int currentP=page.getCurrentP();
					int row=(currentP-1)*perR+1;			
					rs.absolute(row);
					rs.previous();
				}
			}catch(SQLException e){
				System.out.println("setRs()方法出错！");
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	public void OpCreatePage(ResultSet rs){
		page=new CreatePage();
		page.setPerR(perR);			
		try {
			if(rs!=null&&rs.next()){
				rs.last();					
				page.setAllR(rs.getRow());			//设置总记录数
				page.setAllP();
				page.setCurrentP(currentP);
				page.setPageInfo();
				page.setPageLink(gowhich);
			}
		} catch (SQLException e) {
			System.out.println("OpCreatePage()方法出错！");
			e.printStackTrace();
		}		
	}
	
	public CreatePage getPage(){
		return this.page;
	}
}

package com.yxq.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	private String className;
	private String url;
	private String username;
	private String password;
	private Connection con;
	private PreparedStatement pstm;
	
	public DB(){
		className="com.mysql.jdbc.Driver";
		url="jdbc:mysql://localhost:3306/db_luntan";
		username="root";
		password="zhangdeyun";
		try{
			Class.forName(className);
		}catch(ClassNotFoundException e){
			System.out.println("�������ݿ���������ʧ�ܣ�");
			e.printStackTrace();
		}
	}
	public void getCon(){
		try {
			con=DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			System.out.println("��ȡ���ݿ�����ʧ�ܣ�");
			e.printStackTrace();
		}
	}
	public void doPstm(String sql,Object[] params){
		if(sql!=null&&!sql.equals("")){
			System.out.println(sql);
			getCon();
			try {
				pstm=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				if(params==null){
					params=new Object[0];
				}
				for(int i=0;i<params.length;i++){
					pstm.setObject(i+1,params[i]);
				}
				pstm.execute();
			} catch (SQLException e) {
				System.out.println("����DB����doPstm����ʱ����");
				e.printStackTrace();
			}
		}
	}
	
	public ResultSet getRs(){
		try {			
			return pstm.getResultSet();
		} catch (SQLException e) {
			System.out.println("DB���е�getRs()��������");
			e.printStackTrace();
			return null;
		}
	}	
	
	public int getUpdate(){
		try {
			return pstm.getUpdateCount();
		} catch (SQLException e) {			
			e.printStackTrace();
			return -1;
		}
	}
	
	public void closed(){
		try{
			if(pstm!=null)
				pstm.close();
		}catch(Exception e){
			System.out.println("�ر�pstm����ʧ�ܣ�");
		}
		try{
			if(con!=null)
				con.close();
		}catch(Exception e){
			System.out.println("�ر�con����ʧ�ܣ�");
		}
	}
	

}

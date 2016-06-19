<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>

<html>
  <head>
    <title>显示某版面中的所有帖子</title>
  </head>
  <body>
    <center>
      <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#E0E0E0" bordercolorlight="#E3E3E3" bordercolordark="white" rules="rows" style="margin-top:8">          
          <tr height="45" bgcolor="#F9F9F9">
              <!-- 版面公告 -->
              <td colspan="4" style="text-indent:10">
                  版面公告：<bean:write name="boardPcard" filter="false"/>
              </td>
              <!-- “发表帖子”超链接 -->
              <td colspan="2" align="center"><a href="needLogin/addBbs.do?method=addBbs">[发表帖子]</a></td>
          </tr>
          
          <!-- 版面跳转 -->
          <tr height="30" bgcolor="#F9F9F9">
              <html:form action="user/jumpBoard.do">              
              <td colspan="6" align="right" background="images/index/boardE.jpg">
                  <input type="hidden" name="method" value="rootListShow">
                  跳转版面:
                  <html:select property="boardId">
                      <html:option value="">-版面跳转--</html:option>
                      <html:options collection="jumpBoard" property="value" labelProperty="label"/>
                  </html:select>
                  <html:submit value="跳转"/>
                  &nbsp;
              </td>
              </html:form>
          </tr>
          
          <!-- ****************显示置顶帖子**************** -->
          <tr height="30"><td colspan="6" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">■ 置顶帖子</font></b></td></tr>
          <tr height="30" align="center">
              <td width="8%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="22%">发表者</td>
              <td width="28%" colspan="2">最后回复</td>
          </tr>
          <!-- 置顶帖子列表不存在 -->
          <logic:notPresent name="topbbslist" scope="session">
              <tr height="70"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>置顶帖子列表不存在！</li></font></td></tr>
          </logic:notPresent>
          <!-- 置顶帖子列表存在 -->
          <logic:present name="topbbslist" scope="session">
	          <!-- 置顶帖子列表为空 -->
              <logic:empty name="topbbslist" scope="session">
                  <tr height="70"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>没有置顶帖子！</li></font></td></tr>
              </logic:empty>
              <!-- 置顶帖子列表不为空 -->
              <logic:notEmpty name="topbbslist" scope="session">
                  <tr>
                      <td colspan="6">
                          <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="all">
                              <!-- 遍历置顶帖子列表 -->
                              <logic:iterate id="topBbsSingle" name="topbbslist">
                                  <tr height="35" style="text-indent:5" bgcolor="#FBFBFB">
                       			      <td width="8%" align="center">置顶</td>
			                          <td width="35%" style="text-indent:10">                             
            			                  <img src="images/face/bbs/${topBbsSingle.bbsFace}">
                        			      <a href="user/openShow.do?method=openShow&showpage=1&bbsId=${topBbsSingle.bbsId}"><bean:write name="topBbsSingle" property="subBbsTitle[18]" filter="false"/></a>
			                          </td>
            			              <td width="7%" align="center"><bean:write name="topBbsSingle" property="bbsAnswerNum"/></td>
                        			  <td width="22%" align="center">
			                              <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${topBbsSingle.bbsSender}">
            			                      <b><bean:write name="topBbsSingle" property="bbsSender" filter="false"/></b>
                        			          <br><bean:write name="topBbsSingle" property="bbsSendTime"/>
                			              </a>
			                          </td>
            			              <td width="28%" align="center" colspan="2">
                        			      <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${topBbsSingle.bbsLastUpdateUser}">
		                            	      <b><bean:write name="topBbsSingle" property="bbsLastUpdateUser" filter="false"/></b>
        		                        	  <br><bean:write name="topBbsSingle" property="bbsLastUpdateTime"/>
                        			      </a>
    			                      </td>                          
                			      </tr>
			                  </logic:iterate>
			              </table>
			          </td>
			      </tr>              
              </logic:notEmpty>
          </logic:present>
          <tr height="30"><td colspan="6" align="right" background="images/index/boardE.jpg"></td></tr>
          
          <!-- ****************显示普通帖子**************** -->
          <tr height="30"><td colspan="6" style="text-indent:5" background="images/index/classT.jpg"><b><font color="white">■ 其他帖子</font></b></td></tr>
          <tr height="30" align="center" bgcolor="#F4F4F4">
              <td width="8%">状态</td>
              <td width="35%">帖子标题</td>
              <td width="7%">回复数</td>
              <td width="22%">发布者</td>
              <td width="22%">最后回复</td>
              <td width="6%">操作</td>
          </tr>
          <!-- 普通帖子列表不存在 -->
          <logic:notPresent name="otherbbslist" scope="session">
              <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>对不起，帖子列表不存在！</li></font></td></tr>
          </logic:notPresent>
          <!-- 普通帖子列表存在 -->
          <logic:present name="otherbbslist" scope="session">
              <!-- 普通帖子列表为空 -->
              <logic:empty name="otherbbslist" scope="session">
                  <tr height="180"><td bgcolor="#F9F9F9" align="center" colspan="6"><font color="red"><li>对不起，帖子列表不存在！</li></font></td></tr>
              </logic:empty>
              <!-- 普通帖子列表不为空 -->
              <logic:notEmpty name="otherbbslist" scope="session">
                  <tr>
                      <td colspan="6">
                          <table border="1" width="100%" cellspacing="0" cellpadding="0" bordercolor="#F0F0F0" bordercolorlight="#F0F0F0" bordercolordark="white" rules="all">
			 	              <!-- 遍历普通帖子列表 -->
                  		      <logic:iterate id="otherBbsSingle" name="otherbbslist">
			                      <tr height="35" bgcolor="#F9F9F9">
            			              <!-- 输出帖子状态 -->
            			              <td align="center" width="8%">
                        			      <logic:equal value="1" name="otherBbsSingle" property="bbsIsGood">
                            	    		  精华
		                        	      </logic:equal>
        		                    	  <logic:equal value="0" name="otherBbsSingle" property="bbsIsGood">
                		                	  普通
	                        		      </logic:equal>                              
			                          </td>
			                          <!-- 输出帖子标题 -->
            			              <td style="text-indent:10" width="35%">
                        			      <img src="images/face/bbs/${otherBbsSingle.bbsFace}">
			                              <a href="user/openShow.do?method=openShow&showpage=1&bbsId=${otherBbsSingle.bbsId}"><bean:write name="otherBbsSingle" property="subBbsTitle[18]" filter="false"/></a>
            			              </td>
            			              <!-- 输出帖子回复数 -->
    			                      <td align="center" width="7%"><bean:write name="otherBbsSingle" property="bbsAnswerNum"/></td>
                			          <!-- 输出帖子发表者 -->
                			          <td align="center" width="22%">
                            			  <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${otherBbsSingle.bbsSender}">
			                                  <b><bean:write name="otherBbsSingle" property="bbsSender" filter="false"/></b>
        		                        	  <br><bean:write name="otherBbsSingle" property="bbsSendTime"/>
                        			      </a>
    			                      </td>
                			          <!-- 输出最后回复者 -->
                			          <td align="center" width="22%">
                            			  <a href="bbs/user/getUserSingle.do?method=getUserSingle&userName=${otherBbsSingle.bbsLastUpdateUser}">
			                                  <b><bean:write name="otherBbsSingle" property="bbsLastUpdateUser" filter="false"/></b>
            			                      <br><bean:write name="otherBbsSingle" property="bbsLastUpdateTime"/>
                        			      </a>
			                          </td>
			                          <!-- “删除”超链接 -->
            			              <td align="center" width="6%"><a href="needLogin/deleteRoot.do?method=deleteRootBbs&bbsId=${otherBbsSingle.bbsId}&bbsSender=${otherBbsSingle.bbsSender}" title="楼主/管理员操作" onclick="javaScript:return confirm('确认要删除该信息?')">×删除</a></td>
			                      </tr>
            			      </logic:iterate>
		                  </table>
	                  </td>
	              </tr>                  
              </logic:notEmpty>
          </logic:present>          

          <tr height="10" bgcolor="#F4F4F4"><td colspan="6" align="right"></td></tr>                    
          <!-- ****************分页导航栏**************** -->          
          <tr height="30">
              <td colspan="6" align="right" background="images/index/boardE.jpg">
                  <jsp:include flush="true" page="/pages/page.jsp">
                      <jsp:param name="gowhich" value="user/listShow.do?method=rootListShow"/>
                  </jsp:include>
              </td>
          </tr>          
          <tr height="10" bgcolor="#F4F4F4"><td colspan="6" align="right"></td></tr>          
      </table>
    </center>
  </body>
</html>
<%@ page contentType="text/html; charset=gb2312"%>
<table border="0">
     <tr>
         <td>
            <% for(int i=0;i<20;i++){ 
                   if(i!=0&&i%10==0)
                      out.print("<br>");
            %>
                  <input type="radio" name="bbsFace" value="face<%=i%>.gif"><img src="images/face/bbs/face<%=i%>.gif">
            <% } %>
         </td>
     </tr>    
</table>

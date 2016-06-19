<%@ page contentType="text/html; charset=gb2312"%>
<table border="0">
     <tr>
         <td>	 
         		 <img src="images/index/bfn.gif" onclick="bold(content)">
         		 <img src="images/index/ifn.gif" onclick="italic(content)">
         		 <img src="images/index/ufn.gif" onclick="line(content)">

                 字体：
                 <SELECT onChange="showface(content,this.options[this.selectedIndex].value)"> 
			         <option value="宋体" selected>宋体</option>
			         <option value="楷体_GB2312">楷体_GB2312</option>
			         <option value="新宋体">新宋体</option>
			         <option value="隶书">隶书</option>
			         <option value="黑体">黑体</option>
			         <option value="幼圆">幼圆</option>
			         <option value="Times New Roman">Times New Roman</option>
			         <option value="Arial Black">Arial Black</option>
        	     </SELECT>        	     
        	     大小：
        		 <SELECT onChange="showsize(content,this.options[this.selectedIndex].value)"> 
			         <option value="12px" selected>12px</option>
			         <option value="14px">14px</option>
			         <option value="16px">16px</option>
			         <option value="18px">18px</option>
			         <option value="24px">24px</option>
			         <option value="36px">36px</option>
        		 </SELECT>
        		 颜色：
        		 <SELECT onChange="showcolor(content,this.options[this.selectedIndex].value)"> 
			         <option style="background-color:black;color: black" value="black" selected>黑色</option>
			         <option style="background-color:white;color: white" value="white">         白色</option>
			         <option style="background-color:red;color: red" value="red">				红色</option>
			         <option style="background-color:green;color: green" value="green">			绿色</option>
			         <option style="background-color:blue;color: blue" value="blue">			蓝色</option>
			         <option style="background-color:yellow;color: yellow" value="yellow">		黄色</option>
			         <option style="background-color:purple;color: purple" value="purple">		紫色</option>
			         <option style="background-color:gold;color: gold" value="gold">			金色</option>
			         <option style="background-color:gray;color: gray" value="gray">			灰色</option>
			         <option style="background-color:orange;color: orange" value="orange">		橘黄</option>			         			         
        		 </SELECT>
         </td>
     </tr>    
</table>

<div id="User" style="position:absolute;width:240px; height:139px;display:none;">
  <textarea rows="10" cols="30" id="temp">
  
  </textarea>
  <input type="button" onclick="copyTo(content,User,temp)">
</div>

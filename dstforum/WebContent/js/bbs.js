function check(fieldName,UseName,RemName,len){
    if(fieldName.value.length>len){
        fieldName.value=(fieldName.value).substring(0,len);
        alert("最多可只允许输入 "+len+" 个字符！");
        return false;
    }
    else{
        UseName.value=eval(fieldName.value.length);
        RemName.value=len-UseName.value;
        return true;
    }
}

function doText(ob,text) {
	ob.value+=text
	ob.focus();
}

function bold(ob) {
	inTxt=prompt("加粗文字！","请输入要加粗的文字！");     
	if (inTxt!=null) {           
		bTxt="[b]"+inTxt+"[/b]";
		doText(ob,bTxt);
	}
}

function italic(ob) {
	inTxt=prompt("倾斜文字.","请输入要倾斜的文字！");     
	if (inTxt!=null) {           
		iTxt="[i]"+inTxt+"[/i]";
		doText(ob,iTxt);
	}
}

function line(ob) {
	inTxt=prompt("加下化线.","请输入要下化线的文字！");     
	if (inTxt!=null) {           
		lTxt="[u]"+inTxt+"[/u]";
		doText(ob,lTxt);
	}
}

function showface(ob,face) {
	inTxt=prompt("设置字体样式为："+face,"请输入要设置样式的文字！"); 
	if (inTxt!=null) { 
		fTxt="[Fface="+face+"]"+inTxt+"[/font]";
		doText(ob,fTxt);
	}
}

function showsize(ob,size) {
	inTxt=prompt("设置字体大小为："+size,"请输入要设置大小的文字！"); 
	if (inTxt!=null) { 
		sTxt="[Fstyle=font-size:"+size+"]"+inTxt+"[/font]";
		doText(ob,sTxt);
	}
}

function showcolor(ob,color) {
	inTxt=prompt("设置字体颜色！","请输入要设置颜色的文字！"); 
	if(inTxt!=null){
		cTxt="[Fcolor="+color+"]"+inTxt+"[/font]"; 
		doText(ob,cTxt);
	}	
}

function showHead(ico){
	document.images['head'].src="images/face/user/"+ico;
}
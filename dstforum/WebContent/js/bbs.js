function check(fieldName,UseName,RemName,len){
    if(fieldName.value.length>len){
        fieldName.value=(fieldName.value).substring(0,len);
        alert("����ֻ�������� "+len+" ���ַ���");
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
	inTxt=prompt("�Ӵ����֣�","������Ҫ�Ӵֵ����֣�");     
	if (inTxt!=null) {           
		bTxt="[b]"+inTxt+"[/b]";
		doText(ob,bTxt);
	}
}

function italic(ob) {
	inTxt=prompt("��б����.","������Ҫ��б�����֣�");     
	if (inTxt!=null) {           
		iTxt="[i]"+inTxt+"[/i]";
		doText(ob,iTxt);
	}
}

function line(ob) {
	inTxt=prompt("���»���.","������Ҫ�»��ߵ����֣�");     
	if (inTxt!=null) {           
		lTxt="[u]"+inTxt+"[/u]";
		doText(ob,lTxt);
	}
}

function showface(ob,face) {
	inTxt=prompt("����������ʽΪ��"+face,"������Ҫ������ʽ�����֣�"); 
	if (inTxt!=null) { 
		fTxt="[Fface="+face+"]"+inTxt+"[/font]";
		doText(ob,fTxt);
	}
}

function showsize(ob,size) {
	inTxt=prompt("���������СΪ��"+size,"������Ҫ���ô�С�����֣�"); 
	if (inTxt!=null) { 
		sTxt="[Fstyle=font-size:"+size+"]"+inTxt+"[/font]";
		doText(ob,sTxt);
	}
}

function showcolor(ob,color) {
	inTxt=prompt("����������ɫ��","������Ҫ������ɫ�����֣�"); 
	if(inTxt!=null){
		cTxt="[Fcolor="+color+"]"+inTxt+"[/font]"; 
		doText(ob,cTxt);
	}	
}

function showHead(ico){
	document.images['head'].src="images/face/user/"+ico;
}
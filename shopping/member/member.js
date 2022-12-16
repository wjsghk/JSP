function go_save(){
	
}
function idcheck(){
	if(document.formm.id.value == ""){
	alert('아이디를 입력하여 주십시오.');
	document.formm.id.focus();
	return;	
	}
	var url= "NonageServlet?command=id_check_form&id=" 
	+ document.formm.id.value;
	window.open(url,"_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=430, height=200");	
	}
function post_zip(){
	var url =  "NonageServlet?command=find_zip_num";
	window.open(url,"_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=550,height=300, top=300, left=300, ");
}

function go_next() {
 if (document.formm.okon1[0].checked == true) {
 document.formm.action = "NonageServlet?command=join_form";
document.formm.submit();
 } else if (document.formm.okon1[1].checked == true) {
 alert('약관에 동의하셔야만 합니다.');
  }
}
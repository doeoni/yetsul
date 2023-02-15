/**
 * pwCheck.js
 */

function pwCheck(){
	if(f.pw.value != f.cPw.value){
		alert("비밀번호가 다릅니다.");
		f.pw.value="";
		f.cPw.value="";
		f.pw.focus();
		return false;
	};
}
/**
 * joinCheck.js
 */

document.write('<script src="/include/js/valueCheck.js"></script>');

function joinCheck(){
	
	var x=true;
	var str='';
	var fo;
	var obj={
		name : f.name,
		phone : f.phone,
		email : f.email,
		postcode : f.postcode,
		addr : f.detailAddress
	};
	if(f.id.value==''){
		str='아이디를 입력하세요';
		x=false;
		fo=f.id;
	}else if(f.cPw.value==''){
		str='비밀번호를 입력하세요';
		x=false;
		fo=f.pw;
	}else if(f.idUncheck.value!='idCheck'){
		str='아이디를 중복확인 하세요';
		x=false;
		fo=f.id;
	}
	return valueCheck(obj,x,str,fo);
}




/**
 * logout.js
 */

document.write('<script src="/include/js/valueCheck.js"></script>');

function logoutOK(){
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
	x = valueCheck(obj,x,str,fo);
	alert("return x= "+x);
	if(x){
		x=confirm("회원정보 변경 시, 로그아웃됩니다.\n회원정보를 변경하시겠습니까?");
	}
	return x; 
}

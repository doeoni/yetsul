/**
 * valueCheck.js
 */

function valueCheck(f,x,str,fo){
	if(str==''){
		if(f.name.value==''){
			str='이름을 입력하세요';
			x=false;
			fo=f.name;
		}
		else if(f.phone.value==''){
			str='연락처를 입력하세요';
			x=false;
			fo=f.phone;
		}else if(f.email.value==''){
			str='이메일을 입력하세요';
			x=false;
			fo=f.email;
		}else if(f.postcode.value==''){
			str='주소를 입력하세요';
			x=false;
			fo=f.postcode;
		}else if(f.addr.value==''){
			str='상세주소를 입력하세요';
			x=false;
			fo=f.addr;
		}
	}
	if(!x){
		alert(str);
		fo.focus();
	}
	return x;
}

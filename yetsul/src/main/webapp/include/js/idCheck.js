/**
 * idCheck.js
 */

jQuery.ajaxSetup({cache:false});

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(document).ready( function(){
	$('#idCheck').click( function(){	
		var path= getContextPath();
		var dataStr= { userId : $('#id').val() };
		$('#idUncheck').val("idUncheck");
		  		 
		$.ajax({			 
			type: "GET",
			url :  path+"/idCheck.do",
			data : dataStr,
			success: function (data){
				if(data == 'null'){
					var result= confirm("사용 가능한 아이디입니다.사용하시겠습니까?");
					if(result){
						$('#idUncheck').val("idCheck");
						$('#pw').focus();
					} else {
						$('#id').val("");
						$('#id').focus();
					}
				} else {
					alert($('#id').val()+"은(는) 이미 사용중인 아이디입니다.");
					$('#id').val("");
					$('#id').focus();
				}
			}	  
		})
	}) 
})



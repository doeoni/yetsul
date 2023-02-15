/**
 * recipientList.js
 */

jQuery.ajaxSetup({cache:false});

function radioCheck(){
	var unselected = true;
	var radios = document.getElementsByName('recipientId');
	for(var r of radios){
		if(r.checked){
			unselected = false;
		}
	}
	if(unselected){
		alert("변경/삭제할 배송지를 선택하세요.");
	}
	return !unselected;
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(document).ready( function(){
	$('#recipientDel').click( function(){
		var x=radioCheck();
		if(x){
			var path= getContextPath();
			var dataStr= { recipientId : $('input:radio[name="recipientId"]:checked').val() };
			  		 
			$.ajax({			 
				type: "GET",
				url :  path+"/getReNickname.do",
				data : dataStr,
				success: function (data){
					var recipient= JSON.parse(data.trim());
					var result= confirm(recipient.recipientNickname+" 배송지를 삭제하시겠습니까?");
					var url=path+"/recipientList.do";
					if(result){
						if(recipient.recipientStatus == 'Y'){
							alert("기본 배송지는 삭제할 수 없습니다.\n기본 배송지 변경 후 다시 시도하세요.");
							return false;
						}
						url= path+"/recipientDelete.do?recipientId="+recipient.recipientId+"&updatedBy="+recipient.updatedBy;
					}
					location.replace(url);
				}	  
			})
		}
	}) 
})

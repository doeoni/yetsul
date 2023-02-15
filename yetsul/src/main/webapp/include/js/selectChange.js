/**
 * selectChange.js
 */
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

function selectChange(){
	var selectValue = document.getElementById('searchCondition').value;
	var selectGrade = document.getElementById('selectGrade');
	var inputKeyword = document.getElementById('inputKeyword');
	var inputDate = document.getElementById('inputDate');
	
	if(selectValue == "userGrade"){
		selectGrade.style.display="block";
		inputKeyword.style.display="none";
		inputDate.style.display="none";
	}else if(selectValue == "userJoinDate"){
		selectGrade.style.display="none";
		inputKeyword.style.display="none";
		inputDate.style.display="block";
	}else{
		inputKeyword.style.display="block";
		selectGrade.style.display="none";
		inputDate.style.display="none";
	}
}

function orderBy(){
	var path= getContextPath();
	var selectValue= document.getElementById('orderBy').value;
	location.href= path+"/userList.do?orderBy="+selectValue;
}


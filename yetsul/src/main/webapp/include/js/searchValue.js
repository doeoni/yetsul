/**
 * searchValue.js
 */
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

function searchValue(){
	var path=getContextPath();
	var searchCondition = document.getElementById('searchCondition').value;
	var searchKeyword;
	if(searchCondition == "userGrade"){
		searchKeyword = document.getElementById('keywordGrade').value;
	}else if(searchCondition == "userJoinDate"){
		searchKeyword = document.getElementById('keywordDate').value;
	}else{
		searchKeyword = document.getElementById('keywordText').value;
	}
	
	location.href=path+"/userList.do?searchCondition="+searchCondition+"&searchKeyword="+searchKeyword;
}



/**
 * openList.js
 */

var openPopup;

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

function openList(){
	var userId=document.getElementById('userId').value;
	var path=getContextPath();
	window.name="orderForm";
	openPopup=window.open(path+'/popup/recipientList.do?userId='+userId,'배송지 목록','width=800,height=600');
}

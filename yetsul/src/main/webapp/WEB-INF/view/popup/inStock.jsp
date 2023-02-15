<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link href="${path}/include/css/basic.css" rel="stylesheet" type="text/css">
<style>
	table { width: 80%; }
	tr { height: 40px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>제 품 입 고</h1>
		<hr width="80%">
		<br>
		<form name="f">
			<input type="hidden" value="${login.getId()}" id="updatedBy">
			<input type="hidden" value="${product.getProductId()}" id="productId">
			<table style="font-size: small">
				<tr>
					<th>제품명</th><td>&emsp;${product.getProductName()}</td>
				</tr>
				<tr>
					<th>현재 수량</th><td>&emsp;${product.getProductAmount()}</td>
				</tr>
				<tr>
					<th>입고 수량</th><td>&emsp;<input type="text" id="plusAmount" size="5"></td>
				</tr>
			</table>
			<br><br>
			&emsp;<input type="reset" value="다시 작성">
			&emsp;<input type="button" value="입고확인" onclick="inStock()">
		</form>
	</div>
	<br>
</section>

<script>
	function checkAmount(){
		var value= f.plusAmount.value;
		var x=true;
		if(value < 1){
			alert("1개 미만의 재고는 입고할 수 없습니다.");
			x=false;
		}
		return x;
	}
	
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	function inStock(){
		var path=getContextPath();
		var x=checkAmount();
		var amount=f.plusAmount.value;
		var productId=f.productId.value;
		var updatedBy=f.updatedBy.value;
		if(x){
			location.href=path+"/inStockOK.do?productAmount="+amount+"&productId="+productId+"&updatedBy="+updatedBy;
			window.opener.location.reload();
			window.close();
		}
	}
</script>
	
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/include/js/postcode.js"></script>

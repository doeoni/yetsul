<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { 
		width: 80%;
		text-align: center;
	}
	tr { height: 40px; }
	th { width: 120px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>상 세 보 기</h1>
		<hr width="80%">
		<br>
		<form id="f" action="${path}/cartInsert.do">
			<input type="hidden" value="${login.getId()}" name="userId">
			<input type="hidden" value="${product.getProductId()}" name="productId" id="productId">
			<table>
				<tr>
					<th>카테고리</th><td>${product.getProductCategory()}</td>
					<td colspan=2 rowspan=5>
						<img src="${path}/include/img/${product.getProductImg()}" width=200 height=200>
					</td>
				</tr>
				<tr>
					<th>상품명</th><td>${product.getProductName()}</td>
				</tr>
				<tr>
					<th>제조사</th><td>${product.getProductMaker()}</td>
				</tr>
				<tr>
					<th>용량</th><td>${product.getProductSize()}</td>
				</tr>
				<tr>
					<th>도수</th><td>${product.getProductABV()}도</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<fmt:formatNumber var="price" value="${product.getProductPrice()}" pattern="#,###원" />
						${price}
					</td>
					<th>수량</th>
					<td>
						<c:if test="${login.getGrade() != 'ADMIN'}">
							<select name="orderAmount">
								<c:if test="${product.getProductAmount() >=10}">
									<c:forEach var="i" begin="1" end="10">
										<option value="${i}">${i}</option>
									</c:forEach>
								</c:if>
								<c:if test="${product.getProductAmount() < 10}">
									<c:forEach var="i" begin="1" end="${product.getProductAmount()}">
										<option value="${i}">${i}</option>
									</c:forEach>
								</c:if>
							</select>
						</c:if>
						<c:if test="${login.getGrade() == 'ADMIN'}">
							${product.getProductAmount()}개
						</c:if>
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td colspan=3>${product.getProductDesc()}</td>
				</tr>
			</table>
			<br>
			<c:if test="${login.getGrade() != 'ADMIN'}">
				<input type="submit" value="장바구니 담기" >
			</c:if>
			<c:if test="${login.getGrade() == 'ADMIN'}">
				<input type="submit" value="수정하기" formaction="${path}/productEdit.do">
				&emsp;<input type="button" value="입 고" onclick="openInstock()">
			</c:if>
		</form>
	</div>
	<br>
</section>

<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	var openPopup;
	
	function openInstock(){
		window.name="orderForm";
		var path=getContextPath();
		var productId= f.productId.value;
		openPopup=window.open(path+'/popup/inStock.do?productId='+productId,'입고','width=350,height=380');
	}
</script>

<%@ include file="/include/bottom.jsp" %>
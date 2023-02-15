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
	tr { height: 35px; }
	#d {
		text-align: right;
		width: 80%;
	}
</style>
<section>
	<br>
	<div align="center">
		<h1>상 품 목 록</h1>
		<hr width="80%">
		<c:set var="searchCondition" value="productCategory"/>
		<a href="${path}/productList.do">전체보기</a>&emsp;
		<c:set var="keyword" value="소주"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}">소주</a>&emsp;
		<c:set var="keyword" value="일반증류주"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}">일반증류주</a>&emsp;
		<c:set var="keyword" value="리큐르"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}">리큐르</a>&emsp;
		<c:set var="keyword" value="막걸리"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}">막걸리</a>&emsp;
		<c:set var="keyword" value="약주"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}">약주</a>&emsp;
		<c:set var="keyword" value="과실주"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}">과실주</a>&emsp;
		<c:set var="keyword" value="기타"/>
		<a href="${path}/productList.do?searchCondition=${searchCondition}&searchKeyword=${keyword}"> 기타 </a>
		<hr width="80%">
		<c:if test="${login.getGrade() eq 'ADMIN'}">
			<div id="d">
				<input type="button" value="상품등록" onclick="location.href='${path}/insert.do'">
			</div>
		</c:if>
		<table>
			<tr>
				<th>카테고리</th>
				<th>상 품</th>
				<th>상품명</th>
				<th>가 격</th>
				<th>용 량</th>
				<th>도 수</th>
				<th>상세보기</th>
			</tr>
			<c:if test="${empty pList}">
				<tr>
					<td colspan=7 align="center">판매중인 상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty pList}">
				<c:forEach items="${pList}" var="p">
					<tr>
						<td>${p.getProductCategory()}</td>
						<td><img src="${path}/include/img/${p.getProductImg()}" width=80 height=80></td>
						<td>${p.getProductName()}</td>
						<fmt:formatNumber var="price" value="${p.getProductPrice()}" pattern="#,###원" />
						<td>${price}</td>
						<td>${p.getProductSize()}</td>
						<td>${p.getProductABV()}도</td>
						<td><input type="button" value="상세보기" onclick="location.href='${path}/getProduct.do?productId=${p.getProductId()}'"></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	<br>
	<c:forEach var="i" begin="${page.getPageStart()}" end="${page.getPageEnd()}">
		<c:set var="nowRecode" value="${(i-1)*page.getDisplayRecode()+1}"/>
		<c:if test="${page.getNowRecode() == nowRecode}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${page.getNowRecode() != nowRecode}">
			<a href="${path}/productList.do?nowRecode=${nowRecode}&searchCondition=${page.getSearchCondition()}&searchKeyword=${page.getSearchKeyword()}">[${i}]</a>
		</c:if>
	</c:forEach>
	
	<br>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>
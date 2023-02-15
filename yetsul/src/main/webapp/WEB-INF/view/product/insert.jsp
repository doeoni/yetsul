<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	table { 
		width: 80%;
	}
	tr { height: 40px; }
	th { width: 120px; }
</style>
<section>
	<br>
	<div align="center">
		<h1>상 품 등 록</h1>
		<hr width="80%">
		<br>
		<form action="${path}/insertOK.do" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${login.getId()}" name="createdBy">
			<table>
				<tr>
					<th>상품명</th><td>&emsp;<input type="text" name="productName"></td>
					<th>수량</th><td>&emsp;<input type="text" name="productAmount"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td colspan=3>
						&emsp;<input type="radio" name="productCategory" value="소주">소주
						&emsp;<input type="radio" name="productCategory" value="일반증류주">일반증류주
						&emsp;<input type="radio" name="productCategory" value="리큐르">리큐르
						&emsp;<input type="radio" name="productCategory" value="막걸리">막걸리
						&emsp;<input type="radio" name="productCategory" value="약주">약주
						&emsp;<input type="radio" name="productCategory" value="과실주">과실주
						&emsp;<input type="radio" name="productCategory" value="기타">기타
					</td>
				</tr>
				<tr>
					<th>가격</th><td>&emsp;<input type="text" name="productPrice"></td>
					<th>제조사</th><td colspan=3>&emsp;<input type="text" name="productMaker"></td>
				</tr>
				<tr>
					<th>용량</th><td>&emsp;<input type=text" name="productSize"></td>
					<th>도수</th><td>&emsp;<input type="text" name="productABV"></td>
				</tr>
				<tr>
					<th>설명</th>
					<td colspan=3>&emsp;<textarea rows=10 cols=50 name="productDesc"></textarea></td>
				</tr>
				<tr>
					<th>이미지</th><td colspan=3>&emsp;<input type="file" name="productImgFile"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록하기">
			&emsp;<input type="reset" value="다시 작성">
		</form>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>
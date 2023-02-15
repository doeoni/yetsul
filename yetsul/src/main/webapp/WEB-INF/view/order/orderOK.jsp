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
	th { width: 120px; }
	#t { border-bottom: 2px solid; }
</style>
<section>
	<br>
	<div align="center">
		<br>
		<hr width="80%">
		<h2>주문해 주셔서 감사합니다.</h2>
		<span>주문번호 : ${orderId}</span>
		<hr width="80%">
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>
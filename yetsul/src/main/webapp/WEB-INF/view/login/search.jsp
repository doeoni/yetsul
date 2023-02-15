<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/include/top.jsp" %>

<style>
	#t {
		width: 95%;
		border: hidden;
		text-align: center;
	}
	table {	
		width: 350px; 
		align: center;
	}
	tr { height: 40px; }
	th { width: 120px; }
</style>
<section>
	<br>
	<div align="center">
		<table id=t>
			<tr style="border-bottom:hidden;">
				<td>
					<h2>아 이 디 찾 기</h2>
					<hr width="40%">
				</td>
				<td>
					<h2>비 밀 번 호 찾 기</h2>
					<hr width="40%">
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<form action="${path}/idSearch.do" method="post">
						<table align="center">
							<tr>
								<th>이름</th><td><input type="text" name="userName"></td>
							</tr>
							<tr>
								<th>연락처</th><td><input type="text" name="userPhone"></td>
							</tr>
						</table>
						<br>
						<input type="submit" value="찾기">
					</form>
				</td>
				<td>
					<br>
					<form action="${path}/pwChange.do" method="post">
						<table align="center">
							<tr>
								<th>아이디</th><td><input type="text" name="userId"></td>
							</tr>
							<tr>
								<th>이름</th><td><input type="text" name="userName"></td>
							</tr>
							<tr>
								<th>연락처</th><td><input type="text" name="userPhone"></td>
							</tr>
						</table>
						<br>
						<input type="submit" value="찾기">
					</form>
				</td>
			</tr>
		</table>
	</div>
	<br>
</section>

<%@ include file="/include/bottom.jsp" %>
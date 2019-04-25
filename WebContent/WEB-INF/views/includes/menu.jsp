<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


		<a href="${pageContext.request.contextPath }/main/main">
			<img class="logo" src="${pageContext.request.contextPath }/assets/images/logo.jpg">
		</a>

<ul class="menu">
		<c:choose>
		<c:when test="${sessionScope.authUser eq null }">
			<!-- 로그인 전 메뉴 -->
			<li><a href="${pageContext.request.contextPath }/users/loginform">로그인</a></li>
			<li><a href="${pageContext.request.contextPath }/users/joinform">회원가입</a></li>		
		</c:when>
		<c:otherwise>
			<!-- 로그인 후 메뉴 -->
			<li><a href="${pageContext.request.contextPath }/users/logout">로그아웃</a></li>
			<li><a href="${pageContext.request.contextPath }/blog/${sessionScope.authUser.id}">내블로그</a></li>
		</c:otherwise>
		</c:choose>
</ul>
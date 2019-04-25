<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jblog.css">
<title>JBlog</title>
</head>
<body>

	<div id="container">

		<div id="header">
			<!-- header -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

		</div>


		<div id="wrapper">
			<div id="content" class="full-screen">
				<c:import url="/WEB-INF/views/includes/admin_menu.jsp"></c:import>

				<form action="${pageContext.request.contextPath }/blog/modifybasic" method="post" enctype="multipart/form-data">
					<table class="admin-config">
						<tr>
							<td class="t">블로그 제목</td>
							<td><input type="text" size="40" name="id" value="${sessionScope.authUser.id }"></td>
							<td><input type="text" size="40" name="blogTitle" value="${blogvo.blogTitle }"></td>
						</tr>

						<c:choose>
							<c:when test="${blogvo.logoFile eq null }">
								<tr>
									<td class="t">로고이미지</td>
									<td><img src="../../assets/images/spring-logo.jpg"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="t">로고이미지</td>
									<!-- 등록한 경우 자신의 로고 -->
									<td><img src="${pageContext.request.contextPath }/upload/${blogvo.logoFile }"></td>
								</tr>
							</c:otherwise>
						</c:choose>

						<tr>
							<td class="t">&nbsp;</td>
							<td><input type="file" name="file"></td>
						</tr>
						<tr>
							<td class="t">&nbsp;</td>
							<td class="s"><input type="submit" value="기본설정 변경"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>


		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	</div>
</body>

</html>
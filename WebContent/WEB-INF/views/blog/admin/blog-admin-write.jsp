<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jblog.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
	
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
				
				
				<form action="${pageContext.request.contextPath }/post/write" method="post">
			      	<table class="admin-cat-write">
			      		<tr>
			      			<td class="t">제목</td>
			      			<td>
			      				<input type="text" size="60" name="postTitle">
				      			<select id ="selectNO" name="cateNo">
			      					 
				      			</select>
				      		</td>
			      		</tr>
			      		<tr>
			      			<td class="t">내용</td>
			      			<td><textarea name="postContent"></textarea></td>
			      		</tr>
			      		<tr>
			      			<td>&nbsp;</td>
			      			<td class="s"><input type="submit" value="포스트하기"></td>
			      		</tr>
			      	</table>
				</form>
			</div>
		</div>
		
				<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		url : "${pageContext.request.contextPath }/post/selectforpost",
		type : "post",
		dataType : "json",
		success : function(list) {
			console.log(list);
			for (var i = 0; i < list.length; i++) {
				console.log(list.length);
				render(list[i]);
					// list 찾기 !! 
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});

});

function render(cateVo){
	str= "<option value="+cateVo.cateNo+">"+cateVo.cateName+"</option>";
	$("#selectNO").append(str);
}
</script>


</html>
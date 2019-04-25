<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/jblog.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<title>JBlog</title>
</head>
<style>
.btn {
	cursor: pointer;
}
</style>
<body>

	<div id="container">

		<div id="header">
			<!-- header -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

		</div>

		<div id="wrapper">
			<div id="content">
				<div class="blog-content">
					<p id="blogTitle">
					<p>
				</div>
				<div >
					<table id="commentsInput" class="blog-list">
						<tr >
							<td>
								댓글달기
							</td>
							<td>
								lgasdf
							</td>
							<td>
								<input type="text" name="">
							</td>
							<td>
								<span><input type="submit" value="저장" id = "btn_insert"></span> 
							</td>
						</tr>
						<tr >
							<td>
								
							</td>
							<td>
								lgasdf
							</td>
							<td>
								asdfasfasdfdasfads
							</td>
							<td>
								1231312312
							</td>
						</tr>
						<tr >
							<td>
								
							</td>
							<td>
								lgasdf
							</td>
							<td>
								asdfasfasdfdasfads
							</td>
							<td>
								1231312312
							</td>
						</tr>
					</table>
					
					
					<ul id="comments" >
					

					</ul>
				</div>	

				<div>
					<ul id="blogList" class="blog-list">

					</ul>
				</div>	
			</div>
		</div>



		<div id="extra">
			<div class="blog-logo">
				<c:choose>
					<c:when test="${blogvo.logoFile eq null }">
						<!-- 기본 로고 -->
						<img src="../assets/images/spring-logo.jpg">
					</c:when>
					<c:otherwise>
						<!-- 등록한 경우 자신의 로고 -->
						<img
							src="${pageContext.request.contextPath }/upload/${blogvo.logoFile }">
					</c:otherwise>
				</c:choose>
			</div>
			<div id="navigation">
				<h2>카테고리</h2>
				<ul>

				</ul>
			</div>
		</div>



		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

	</div>
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var no = 1;
						$
								.ajax({
									url : "${pageContext.request.contextPath }/blog/categoryList",
									type : "post",
									dataType : "json",
									success : function(list) {
										console.log(list);
										console.log(list[0].cateNo);
										var no = list[0].cateNo;

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
						var cateNo = no
						str = "";
						as = "";

						$
								.ajax({
									url : "${pageContext.request.contextPath }/blog/postbycateno",
									type : "post",
									dataType : "json",
									data : {
										cateNo : cateNo
									},
									success : function(list) {
										console.log(list);
										if (list.length == 0) {
											$("#blogList").html(
													"등록된 게시글이 없습니다.");
										} else {
											for (var i = 0; i < list.length; i++) {
												console.log(list.length);

												str += "<li id=listno"+list[i].postNo+"  data-cateno="+list[i].cateNo+" data-postno="+list[i].postNo+" class='btn'>"
												str += "<strong>"+list[i].postTitle+"</strong> "
												str += "<span>"+list[i].regDate+"</span>"
												str += "</li>"
											}
											$("#blogList").html(str);
											str = "";
										}
									},
									error : function(XHR, status, error) {
										console.error(status + " : " + error);
									}
								});

						$
								.ajax({
									url : "${pageContext.request.contextPath }/blog/posttitle",
									type : "post",
									dataType : "json",
									data : {
										cateNo : cateNo
									},
									success : function(list) {
										console.log(list);
										if (list.length == 0) {
											console.log("nothing postContent")
											$("#blogTitle")
													.html("등록된 글이 없습니다.")
										} else {
											console.log(list.length);
											for (var i = 0; i < list.length; i++) {

												as += "<br>"+ list[i].postTitle+ "<br>";
												as += "<br>"+ list[i].postContent+ "<br>";

											}
											$("#blogTitle").html(as);
											as = "";
										}
									},
									error : function(XHR, status, error) {
										console.error(status + " : " + error);
									}
								});

					});

	$("#navigation")
			.on(
					"click",
					"li",
					function() {
						var $this = $(this);
						console.log($this);
						var cateNo = $this.data("cateno");
						console.log(cateNo);
						str = "";
						$
								.ajax({
									url : "${pageContext.request.contextPath }/blog/postbycateno",
									type : "post",
									dataType : "json",
									data : {
										cateNo : cateNo
									},
									success : function(list) {
										console.log(list);
										if (list.length == 0) {
											$("#blogList").html(
													"등록된 게시글이 없습니다.");
										} else {
											for (var i = 0; i < list.length; i++) {
												console.log(list.length);
												str += "<li id=listno"+list[i].postNo+" data-cateno="+list[i].cateNo+" data-postno="+list[i].postNo+" class='btn'>"
												str += "<strong>"+ list[i].postTitle+"</strong> "
												str += "<span>"+ list[i].regDate+ "</span>"
												str += "</li>"
											}
											$("#blogList").html(str);
											str = "";
										}
									},
									error : function(XHR, status, error) {
										console.error(status + " : " + error);
									}
								});
					});

	// blog title list 
	$("#navigation").on("click", "li", function() {
		var $this = $(this);
		console.log($this);
		var cateNo = $this.data("cateno");
		console.log(cateNo);
		as = "";
		$.ajax({
			url : "${pageContext.request.contextPath }/blog/posttitle",
			type : "post",
			dataType : "json",
			data : {
				cateNo : cateNo
			},
			success : function(list) {
				console.log(list);
				if (list.length == 0) {
					console.log("nothing postContent")
					$("#blogTitle").html("등록된 글이 없습니다.")
				} else {
					console.log(list.length);
					for (var i = 0; i < list.length; i++) {
						as += "<br>" + list[i].postTitle + "<br>";
						as += "<br>" + list[i].postContent + "<br>";
					}
					$("#blogTitle").html(as);
					as = "";
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});

	$("#blogList").on("click", "li", function() {
		console.log("list click!");
		$this = $(this);
		console.log($this);
		var cateNo = $this.data("cateno");
		console.log(cateNo);
		var postNo = $this.data("postno");
		console.log(postNo);
		as = "";
		$.ajax({
			url : "${pageContext.request.contextPath }/blog/postcontent",
			type : "post",
			dataType : "json",
			data : {
				cateNo : cateNo,
				postNo : postNo
			},
			success : function(list) {
				console.log(list);
				if (list.length == 0) {
					console.log("nothing postContent")
					$("#blogTitle").html("등록된 글이 없습니다.")
				} else {
					console.log(list.length);
					for (var i = 0; i < list.length; i++) {
						as += "<br>" + list[i].postTitle + "<br>";
						as += "<br>" + list[i].postContent + "<br>";
					}
					$("#blogTitle").html(as);
					as = "";
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	})
	
	$("#btn_insert").on("click",function(){
		console.log("click me !!")	
	});
	
	function render(cateVo) {
		str = "<li id=no"+cateVo.cateNo+" data-cateno="+cateVo.cateNo+" class='btn'>"
				+ cateVo.cateName + "</li>";
		$("#navigation").append(str);
	}
</script>
</html>
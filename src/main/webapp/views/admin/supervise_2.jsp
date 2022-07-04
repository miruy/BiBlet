<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>

<section class="container mx-auto">

<div class="flex flex-col justify-center bg-white pt-2 pb-8 pl-8 pr-8">


		<div class="px-10 py-8 my-4 w-full bg-gray-100 admin_font">

			<%--평가 관리--%>
			<div id="starManagement">

				starManagement

			</div>

		</div>











</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(document).ready(() => {
		$("#star_tab").addClass("tab-active");
		$("#starManagement").addClass("active")
	});

	$("#admin_tab_group > button").click((event) => {
		$("#admin_tab_group > button").removeClass("tab-active");
		$(event.target).addClass("tab-active");

		$("#tab_content_group > div").removeClass("active");

		if (event.target.id == "user_tab") {
			console.log("user_tab 선택함")
			$("#userManagement").addClass("active");
		} else if (event.target.id == "star_tab") {
			console.log("star_tab 선택함")
			$("#starManagement").addClass("active");

		} else if (event.target.id == "comment_tab") {
			console.log("comment_tab 선택함")
			$("#commentManagement").addClass("active");

		} else if (event.target.id == "notice_tab") {
			console.log("notice_tab 선택함")
			$("#noticeManagement").addClass("active");

		} else if (event.target.id == "admin_tab") {
			console.log("comment_tab 선택함")
			$("#adminManagement").addClass("active");

		}
	})



</script>
</section>

<%@ include file="../common/footer.jsp" %>
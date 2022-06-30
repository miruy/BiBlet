<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%-- jqueryCDN --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
			integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="/css/tailwind.output.css"/>

<title>BiBlet-supervise</title>

</head>
<body>
<div class="flex flex-col justify-center bg-white px-8 py-8">
	<div class="card w-full bg-gray-50 shadow-xl p-10">

		<div class="flex flex flex-row">
			<a href="/" class="text-gray-800"><header_biblet class="normal-case text-4xl border-0 ml-16 mt-4">BiBlet</header_biblet></a>

			<div id="admin_tab_group"class="tabs mx-auto">
				<button id="user_tab" class="tab tab-bordered h-10 text-2xl font-bold">회원 관리
					<svg class="w-8 h-8 ml-1" viewBox="0 0 21 21" xmlns="http://www.w3.org/2000/svg">
						<g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linejoin="round" transform="translate(3 2)"><path d="m8.5 2.5 2 2v1c0 1.65685425-1.34314575 3-3 3-1.59768088 0-2.90366088-1.24891996-2.99490731-2.82372721l-.00509269-1.17627279z" stroke-linecap="round"/><path d="m2.5 10v-4.5c0-2.76142375 2.23857625-5 5-5 2.7614237 0 5 2.23857625 5 5v4.5"/><path d="m14.5 14.5v-.7281753c0-3.1864098-3.6862915-5.2718247-7-5.2718247s-7 2.0854149-7 5.2718247v.7281753c0 .5522847.44771525 1 1 1h12c.5522847 0 1-.4477153 1-1z" stroke-linecap="round"/></g>
					</svg>
				</button>
				<button id="star_tab" class="tab tab-bordered h-10 text-2xl font-bold">평가 관리
					<svg class="w-8 h-8 ml-1" viewBox="0 0 21 21" xmlns="http://www.w3.org/2000/svg">
						<path d="m7.5 11.5-5 3 2-5.131-4-3.869h5l2-5 2 5h5l-4 4 2 5z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(3 3)"/>
					</svg>
				</button>
				<button id="comment_tab" class="tab tab-bordered h-10 text-2xl font-bold">코멘트 관리</button>
				<button id="notice_tab" class="tab tab-bordered h-10 text-2xl font-bold">공지 관리</button>
				<button id="admin_tab" class="tab tab-bordered h-10 text-2xl font-bold">관리자 정보</button>
			</div>

		</div>


		<div id="tab_content_group" class="px-10 py-8 my-4 w-full bg-gray-100">

			<form class="flex items-center">
				<div class="relative w-full">
					<div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
						<svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
					</div>
					<input type="text" id="search" class="h-10 input input-bordered text-gray-900 text-sm rounded-lg w-full pl-10 p-2.5" placeholder="Search" />
				</div>
				<button type="submit" class="p-2.5 ml-2 text-sm font-medium text-gray-600 hover:text-white btn-secondary rounded-lg"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg></button>
			</form>

			<%--회원 관리--%>
			<div id="userManagement">
				<div class="my-8">
					userManagement

				</div>
			</div>

			<%--평가 관리--%>
			<div id="starManagement">
				starManagement
			</div>

			<%--코멘트 관리--%>
			<div id="commentManagement">
				commentManagement
			</div>

			<%--코멘트 관리--%>
			<div id="noticeManagement">
				noticeManagement
			</div>

			<%--관리자 관리--%>
			<div id="adminManagement">
				adminManagement
			</div>
		</div>










	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(document).ready(() => {
		$("#user_tab").addClass("tab-active");
		$("#userManagement").addClass("active");
	});

	$("#admin_tab_group > button").click((event) => {
		$("#admin_tab_group > button").removeClass("tab-active");
		$(event.target).addClass("tab-active");

		$("#tab_content_group > div").removeClass("active");

		if (event.target.id == "user_tab") {
			console.log("user_tab 선택함")
			$("#userManagement").addClass("active");
			userEvent();
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

	function userEvent() {

	}
</script>
</body>
</html>
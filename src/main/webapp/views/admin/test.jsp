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
	<div class="card w-full bg-gray-50 shadow-xl p-10 admin_font">

		<div class="flex flex flex-row">
			<a href="/" class="text-gray-800"><header_biblet class="normal-case text-4xl border-0 ml-32 mt-4">BiBlet</header_biblet></a>

			<div id="admin_tab_group" class="tabs mx-auto">
				<button id="user_tab" class="tab tab-bordered h-10 text-2xl">회원 관리
					<svg id="user_svg" enable-background="new 0 0 48 48" class="w-5 h-5 ml-1 " version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><circle cx="24" cy="17" fill="#241F20"  r="6"/><path d="M24,0C10.745,0,0,10.745,0,24s10.745,24,24,24s24-10.745,24-24S37.255,0,24,0z M35.812,40.113v-3.301  C35.812,30.289,30.523,25,24,25c-6.524,0-11.812,5.289-11.812,11.812v3.301C7.231,36.473,4,30.621,4,24C4,12.954,12.954,4,24,4  s20,8.954,20,20C44,30.621,40.769,36.473,35.812,40.113z" fill="#241F20"/></svg>
				</button>
				<button id="star_tab" class="tab tab-bordered h-10 text-2xl">평가 관리
					<svg enable-background="new 0 0 48 48" class="w-5 h-5 ml-1" id="Layer_3" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><circle cx="16.692" cy="8.59" fill="#241F20" r="8.479"/><polygon fill="#241F20" points="35.263,24.379 31.458,32.252 22.525,33.335 29.004,39.372 27.567,47.996 35.263,43.861    42.958,47.996 41.389,39.257 48,33.358 39.067,32.23  "/><path d="M26.321,40.3l-9.256-8.625l12.762-1.548l1.086-2.248c-2.936-4.783-8.198-7.984-14.221-7.984   C7.473,19.895,0,27.369,0,36.588v4.664V48h25.038L26.321,40.3z" fill="#241F20"/></g></svg>
				</button>
				<button id="comment_tab" class="tab tab-bordered h-10 text-2xl">코멘트 관리
					<svg enable-background="new 0 0 48 48" class="w-4 h-4 ml-1" id="Layer_3" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M0,28.375h12.67c-0.062,3.31-1.338,6.313-3.403,8.6c-0.945,0.892-1.982,1.408-2.879,1.706   c-1.1,0.328-2.26,0.396-2.883,0.408H0v2.286h8.75v-0.003c7.205-0.032,13.043-5.816,13.177-12.997H22v-22H0V28.375z" fill="#241F20"/><path d="M26,6.375v22h12.74c0,2.991-1,5.742-2.674,7.956c-0.839,1.089-1.828,1.792-2.761,2.233   c-0.008,0.004-0.016,0.008-0.023,0.012c-0.139,0.065-0.274,0.122-0.409,0.176c-1.514,0.557-3.915,0.587-3.915,0.587H26v2.286h8.75   c7.317,0,13.25-5.933,13.25-13.25v-22H26z" fill="#241F20"/></g></svg>
				</button>
				<button id="notice_tab" class="tab tab-bordered h-10 text-2xl">공지 관리
					<svg enable-background="new 0 0 48 48" class="w-5 h-5 ml-1" id="Layer_3" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M26.22,13.234c0.572,0,1.097-0.202,1.57-0.606c0.469-0.404,0.757-0.894,0.86-1.466   c0.098-0.576-0.024-1.062-0.38-1.466c-0.354-0.408-0.818-0.61-1.392-0.61c-0.576,0-1.1,0.202-1.569,0.61   c-0.474,0.403-0.763,0.89-0.86,1.466c-0.071,0.573,0.066,1.062,0.402,1.466C25.19,13.032,25.648,13.234,26.22,13.234z" fill="#241F20"/><path d="M30.622,27.4c-0.053,0.075-0.104,0.14-0.156,0.216c-0.312,0.396-1.475,1.795-2.984,2.632   c-0.01,0.004-0.019,0.008-0.024,0.014c-0.132,0.07-0.267,0.123-0.401,0.185c-0.398,0.143-0.771,0.179-0.891,0.188   c-0.339-0.044-0.522-0.281-0.522-0.73c0-0.371,0.108-1.104,0.328-2.205l0.254-1.111l1.035-4.968   c0.168-0.846,0.258-1.316,0.278-1.409l0.226-1.162c0.133-0.719,0.201-1.194,0.201-1.426c0-0.444-0.11-0.781-0.287-1.055   c-0.016-0.04-0.037-0.08-0.066-0.122c-0.026-0.032-0.054-0.06-0.082-0.089c-0.031-0.034-0.046-0.063-0.088-0.098   c-0.441-0.36-0.853-0.464-1.137-0.487l0.005-0.008c0,0-1.867-0.141-4.634,1.682c-0.039,0.026-0.063,0.045-0.1,0.07   c-0.75,0.474-1.348,0.949-1.764,1.332c-0.318,0.272-0.562,0.525-0.744,0.762l-0.009,0.011l0.001-0.001   c-0.235,0.311-0.359,0.593-0.359,0.843c0,0.197,0.159,0.394,0.476,0.591c0,0,1.188-1.534,3.185-2.532   c0.15-0.065,0.534-0.224,0.871-0.312c0.158-0.036,0.455-0.064,0.646,0.093c0.136,0.142,0.226,0.339,0.226,0.646   c0,0.279-0.041,0.618-0.127,1.023l-0.201,0.957l-0.252,1.196l-0.986,4.728c-0.504,2.442-0.757,3.903-0.757,4.379   c0,1.123,0.615,1.685,1.843,1.685c0.557,0,1.13-0.101,1.717-0.281c0.004,0,0.006,0.002,0.01,0.004   c0.04-0.014,0.076-0.029,0.115-0.043c0.098-0.031,0.195-0.068,0.293-0.105c2.771-1.031,4.595-3.108,5.146-3.804   c0.049-0.059,0.091-0.114,0.13-0.167c0.031-0.043,0.051-0.072,0.051-0.072h-0.002c0.14-0.206,0.217-0.377,0.217-0.505   C31.299,27.766,31.068,27.587,30.622,27.4z" fill="#241F20"/><path d="M18.732,31.873l1.435-1.436l-2.604-2.606l-1.435,1.438c-0.836-0.554-1.768-0.967-2.764-1.226v-2.147H8.74   v2.147c-1.019,0.264-1.973,0.688-2.822,1.26l-1.378-1.378l-2.605,2.603l1.401,1.402c-0.536,0.82-0.938,1.734-1.19,2.708H0v4.62   h2.146c0.258,0.997,0.671,1.932,1.225,2.768l-1.436,1.437l2.605,2.603l1.437-1.436c0.837,0.555,1.773,0.97,2.773,1.228V48h4.605   v-2.143c0.976-0.252,1.892-0.656,2.715-1.192l1.493,1.493l2.604-2.604l-1.47-1.472c0.574-0.854,1-1.814,1.263-2.838h2.143v-4.591   H19.96C19.703,33.652,19.289,32.713,18.732,31.873z M11.051,40.737c-2.092,0-3.788-1.696-3.788-3.788s1.696-3.789,3.788-3.789   s3.789,1.697,3.789,3.789S13.143,40.737,11.051,40.737z" fill="#241F20"/><path d="M24,0.125C10.814,0.125,0.125,10.814,0.125,24c0,1.757,0.195,3.468,0.555,5.116   c0.968-1.265,2.16-2.344,3.521-3.182C4.14,25.298,4.104,24.653,4.104,24C4.104,13.012,13.012,4.104,24,4.104   S43.896,13.012,43.896,24S34.988,43.896,24,43.896c-0.653,0-1.297-0.036-1.935-0.098c-0.838,1.361-1.917,2.554-3.182,3.521   c1.649,0.36,3.359,0.556,5.116,0.556c13.186,0,23.875-10.689,23.875-23.875S37.186,0.125,24,0.125z" fill="#241F20"/></g></svg>
				<button id="admin_tab" class="tab tab-bordered h-10 text-2xl">관리자 정보
					<svg enable-background="new 0 0 48 48" class="w-5 h-5 ml-1" id="Layer_3" version="1.1" viewBox="0 0 48 48"  xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M23.999,22.863c-10.014,0-18.131,8.119-18.131,18.133v1.727v3.34v1.906h36.264v-1.906v-2.189v-2.877   C42.132,30.982,34.013,22.863,23.999,22.863z" fill="#241F20"/><path d="M14.479,15.936l1.859-0.656c0.502,0.837,1.148,1.593,1.916,2.236l-0.898,1.877l4.033,1.928l0.896-1.877   c0.963,0.189,1.933,0.22,2.88,0.095l0.682,1.934l3.371-1.191l-0.674-1.904c0.864-0.507,1.636-1.168,2.298-1.957l1.875,0.897   l1.923-4.02L32.763,12.4c0.195-0.986,0.225-1.983,0.09-2.951l1.858-0.655l-1.19-3.371l-1.859,0.655   c-0.499-0.834-1.144-1.587-1.907-2.229l0.898-1.879l-4.051-1.938l-0.898,1.881c-1.001-0.195-2.016-0.224-2.997-0.079l-0.63-1.785   l-3.373,1.191l0.641,1.815c-0.812,0.493-1.548,1.124-2.176,1.872l-1.879-0.898l-1.935,4.046l1.88,0.898   c-0.193,0.98-0.221,1.972-0.086,2.936l-1.859,0.655L14.479,15.936z M24,7.562c1.657,0,3,1.343,3,3s-1.343,3-3,3   c-1.657,0-3-1.343-3-3S22.343,7.562,24,7.562z" fill="#241F20"/></g></svg>
				</button>
			</div>

		</div>


		<div id="tab_content_group" class="px-10 py-8 my-4 w-full bg-gray-100">

			<%--회원 관리--%>
			<div id="userManagement">


				<div id="selectMsg" class="mx-auto"></div>
				<form class="flex flex-row justify-center">

						<select id="option" class="select select-bordered h-[3.6rem] mr-2">
							<option disabled selected>선택</option>
							<option id="userNo" name="userNo" value="userNo">회원 번호</option>
							<option id="name" name="name" value="name">이름</option>
							<option id="id" name="id" value="id" >아이디</option>
							<option id="email" name="email" value="email" >이메일</option>
						</select>

						<div class="relative w-96">
							<div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
								<svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
							</div>
							<input type="text" name="keyword" id="keyword" value="${keyword}" class="input input-bordered text-gray-900 text-sm p-7 pl-10 w-full" placeholder="회원 검색" />
							<button type="button" id="admin_search" class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg">검색</button>
						</div>

				</form>


				<div class="my-4">

					<div class="overflow-x-auto">

						<div class="flex flex-row space-x-2">
							<div class="ml-2 mb-2">총 회원 수 :</div>
							<div>${totalUsers}</div>
						</div>

						<table class="table w-full text-center">
							<thead>
							<tr>
								<th>회원번호</th>
								<th>프로필</th>
								<th>이름</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이메일</th>
								<th>가입일자</th>
								<th>이메일 인증 여부</th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${!empty users}">
							<c:forEach var="user" items="${users}">
							<tr class="hover">
								<th>
									${user.userNo}
								</th>
								<td>
									<c:if test="${user.storedPic eq null}">
										<div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
											<svg class="absolute w-12 h-12 text-gray-400 pr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
										</div>
									</c:if>
									<c:if test="${user.storedPic ne null}">
										<c:set var="idSub" value="${fn:substring(user.id,0,5)}"/>
										<c:if test="${idSub ne 'kakao'}">
											<img src="<c:url value='/images/${user.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
										</c:if>
										<c:if test="${idSub eq 'kakao'}">
											<img src="<c:url value='http://${user.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
										</c:if>
									</c:if>
								</td>
								<td>
									${user.name}
								</td>
								<td>
									${user.id}
								</td>
								<td>
									<c:set var="idSub" value="${fn:substring(user.id,0,5)}"/>
									<c:if test="${idSub ne 'kakao'}">
										${user.pass}
									</c:if>
									<c:if test="${idSub eq 'kakao'}">
										<textarea rows="1" class="w-14 bg-white resize-x" disabled>${user.pass}</textarea>
									</c:if>
								</td>
								<td>
									<c:set var="idSub" value="${fn:substring(user.id,0,5)}"/>
									<c:if test="${idSub ne 'kakao'}">
										${user.email}
									</c:if>
									<c:if test="${idSub eq 'kakao'}">
										<textarea rows="1" class="w-24 bg-white resize-x" disabled>${user.email}</textarea>
									</c:if>
								</td>
								<td>
									<fmt:parseDate value="${user.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
									<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${ parsedDateTime }" />
								</td>
								<td>
									<c:if test="${user.authStatus == 1}">
										<span>인증</span>
									</c:if>
									<c:if test="${user.authStatus == 0}">
										<span>미인증</span>
									</c:if>
								</td>

							</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>



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
		$("#userManagement").addClass("active")
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

	$("#admin_search").click(() => {
		let keyword = document.getElementById("keyword").value;
		let option = document.getElementById("option").value;
		console.log(keyword);
		console.log(option);

		$.ajax({
			url: '<c:url value="/admin/adminSearch"/>',
			type: 'POST',
			data: JSON.stringify({
				"option" : option,
				"keyword": keyword
			}),
			contentType: 'application/json',
			success: function (data) {
				for(var i = 0; i < data.item.length; i++){
					if(data.item[i].userNo != null){
						console.log(data.item[i].name);

						if(data.item[i].option == "선택"){
							$("#selectMsg").append("<div class='text-gray-400 text-sm text-center mb-2'>검색조건 미선택 시 '이름' 으로 검색됩니다.</div>");
						}

						let user = data.item[i];


						searchUser(user.userNo, user.name, user.id, user.profile, user.pass, user.email, user.regDate, user.authStatus)

					}
				}
			}, error: function (data) {
				console.log("에러");
			}

		});
	})

	function searchUser(userNo, name, id, profile, pass, email, regDate, authStatus){

		console.log("searchUser : " + userNo);
		console.log(name);
		console.log(id);
		console.log(profile);
		console.log(pass);
		console.log(email);
		console.log(regDate);
		console.log(authStatus);


		// let html = '';
		// html += '<div class="overflow-x-auto">';
		// html += '<div class="flex flex-row space-x-2">';
		// html += '<div class="ml-2 mb-2">검색 회원 수 :</div>';
		// html += '<div>몇명</div>';
		// html += '</div>';
		// html += '<table class="table w-full text-center">';
		// html += '<thead><tr>';
		// html += '<th>회원번호</th><th>프로필</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>이메일</th><th>가입일자</th><th>이메일 인증 여부</th>';
		// html += '</tr></thead><tbody>';
		// for(){
		//
		// }
		// html += '';
		// html += '';
		// html += '';
		// html += '';
		// html += '';
		// html += '';
		// html += '';
		// html += '';

	}
</script>
</body>
</html>
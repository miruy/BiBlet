<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>

<section class="container mx-auto">

<div class="flex flex-col justify-center bg-white pt-2 pb-8 pl-8 pr-8">


		<div id="tab_content_group" class="px-10 py-8 my-4 w-full bg-gray-100 admin_font">

			<%--회원 관리--%>
			<div id="userManagement">

				<div id="selectMsg" class="mx-auto"></div>
				<form class="flex flex-row justify-center" name="requestAdmSearch" method="post" action="/admin/supervise_1">

						<select id="option" name="option" class="select select-bordered h-[3.6rem] mr-2">
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
							<input type="submit" id="admin_search" value="검색" class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg"></input>
						</div>

				</form>


				<div class="my-4">

					<div class="overflow-x-auto">

						<div class="flex flex-row space-x-2">
							<div class="ml-2 mb-2">검색 회원 수 :</div>
							<div>${searchListCount}</div>
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
							<c:if test="${!empty searchList}">
							<c:forEach var="searchUser" items="${searchList}">
							<tr class="hover">
								<th>
									${searchUser.userNo}
								</th>
								<td>
									<c:if test="${searchUser.storedPic eq null}">
										<div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
											<svg class="absolute w-12 h-12 text-gray-400 pr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
										</div>
									</c:if>
									<c:if test="${searchUser.storedPic ne null}">
										<c:set var="idSub" value="${fn:substring(searchUser.id,0,5)}"/>
										<c:if test="${idSub ne 'kakao'}">
											<img src="<c:url value='/images/${searchUser.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
										</c:if>
										<c:if test="${idSub eq 'kakao'}">
											<img src="<c:url value='http://${searchUser.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
										</c:if>
									</c:if>
								</td>
								<td>
									${searchUser.name}
								</td>
								<td>
									${searchUser.id}
								</td>
								<td>
									<c:set var="idSub" value="${fn:substring(searchUser.id,0,5)}"/>
									<c:if test="${idSub ne 'kakao'}">
										${searchUser.pass}
									</c:if>
									<c:if test="${idSub eq 'kakao'}">
										<textarea rows="1" class="w-14 bg-white resize-x" disabled>${searchUser.pass}</textarea>
									</c:if>
								</td>
								<td>
									<c:set var="idSub" value="${fn:substring(searchUser.id,0,5)}"/>
									<c:if test="${idSub ne 'kakao'}">
										${searchUser.email}
									</c:if>
									<c:if test="${idSub eq 'kakao'}">
										<textarea rows="1" class="w-24 bg-white resize-x" disabled>${searchUser.email}</textarea>
									</c:if>
								</td>
								<td>
									<fmt:parseDate value="${searchUser.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
									<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${ parsedDateTime }" />
								</td>
								<td>
									<c:if test="${searchUser.authStatus == 1}">
										<span>인증</span>
									</c:if>
									<c:if test="${searchUser.authStatus == 0}">
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


</script>
</section>

<%@ include file="../common/footer.jsp" %>
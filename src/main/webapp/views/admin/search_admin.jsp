<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>

<section class="container mx-auto">

<div class="flex flex-col justify-center bg-white p-10">


		<div id="tab_content_group" class="px-10 py-8 my-4 w-full rounded-2xl shadow-2xl bg-gray-100 admin_font">

			<%--관리자 정보--%>
			<div id="adminManagement">

				<div id="selectMsg" class="text-gray-500 text-center mb-2">검색 조건 미 선택 시 '이름'으로 검색됩니다.</div>
				<form class="flex flex-row justify-center" name="requestAdmSearch" method="post" action="/admin/supervise_admin">

						<select id="option" name="option" class="select select-bordered h-[3.6rem] mr-2" onChange="searchStatus()">
							<option disabled selected>선택</option>
							<option id="admNo" name="admNo" value="admNo">관리자 번호</option>
							<option id="admName" name="admName" value="admName">이름</option>
							<option id="admId" name="admId" value="admId" >아이디</option>
							<option id="admEmail" name="admEmail" value="admEmail" >이메일</option>
						</select>

						<div class="relative w-96">
							<div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
								<svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
							</div>
							<input type="text" name="keyword" id="keyword" value="${keyword}" class="input input-bordered text-gray-900 text-sm p-7 pl-10 w-full" placeholder="관리자 검색" />
							<input type="submit" id="admin_search" value="검색" class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg"></input>
						</div>

				</form>


				<div class="my-4">

					<div class="overflow-x-auto">

						<div class="justify-between flex flex-row">
							<div class="flex flex-row space-x-2">
								<div class="ml-2 mb-2">총 관리자 수 :</div>
								<div>${searchAdminCount}</div>
							</div>
							<div class="mr-2 mb-2 text-gray-400">관리자 회원가입 시 이름 앞에 'admin_' 이라는 표시가 됩니다.</div>
						</div>

						<table class="table w-full text-center">
							<thead>
							<tr>
								<th>관리자 번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이메일</th>
								<th>가입일자</th>
								<th>이메일 인증 여부</th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${!empty searchAdminList}">
								<c:forEach var="searchAdmin" items="${searchAdminList}">
									<tr class="hover">
										<th>
												${searchAdmin.admNo}
										</th>
										<td>
												${searchAdmin.admName}
										</td>
										<td>
												${searchAdmin.admId}
										</td>
										<td>
											<c:if test="${searchAdmin.admPass.length() >= 10}">
												<textarea rows="1" class="w-14 bg-white resize-x" disabled>${searchAdmin.admPass}</textarea>
											</c:if>
											<c:if test="${searchAdmin.admPass.length() < 10}">
												${searchAdmin.admPass}
											</c:if>
										</td>
										<td>
											<c:if test="${searchAdmin.admEmail.length() >= 25}">
												<textarea rows="1" class="w-14 bg-white resize-x" disabled>${searchAdmin.admEmail}</textarea>
											</c:if>
											<c:if test="${searchAdmin.admEmail.length() < 25}">
												${searchAdmin.admEmail}
											</c:if>
										</td>
										<td>
											<fmt:parseDate value="${searchAdmin.admRegDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
											<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${ parsedDateTime }" />
										</td>
										<td>
											<c:if test="${searchAdmin.admAuthstatus == 1}">
												<span>인증</span>
											</c:if>
											<c:if test="${searchAdmin.admAuthstatus == 0}">
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
		$("#admin_tab").addClass("tab-active");
		$("#adminManagement").addClass("active")
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

	let searchStatus = function() {

		$("#selectMsg").hide();

	}
</script>
</section>

<%@ include file="../common/footer.jsp" %>
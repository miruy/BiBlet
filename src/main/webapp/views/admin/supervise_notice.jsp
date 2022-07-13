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
			<%--공지 관리--%>
			<div id="noticeManagement">

				<div id="selectMsg" class="text-gray-500 text-center mb-2">검색 조건 미 선택 시 '제목'으로 검색됩니다.</div>
				<form class="flex flex-row justify-center" name="requestNoticeSearch" method="post" action="/admin/supervise_notice">

					<select id="option" name="option" class="select select-bordered h-[3.6rem] mr-2" onChange="searchStatus()">
						<option id="default" name="default" value="default" disabled selected>선택</option>
						<option id="noticeNo" name="noticeNo" name="noticeNo">번호</option>
						<option id="noticeTitle" name="noticeTitle" name="noticeTitle">제목</option>
					</select>

					<div class="relative w-96">
						<div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
							<svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
						</div>
						<input type="text" name="keyword" id="keyword" value="${keyword}" class="input input-bordered text-gray-900 text-sm p-7 pl-10 w-full" placeholder="공지사항 검색" />
						<input type="submit" id="noticeSearch" value="검색" class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg" />
					</div>

				</form>


				<div class="my-4">

					<div class="overflow-x-auto">

						<div class="flex flex-row justify-between">
							<div class="flex flex-row space-x-2">
								<div class="ml-2">전체 공지사항 수 :</div>
								<div>${searchNoticeCount}</div>
							</div>

							<button class="btn btn-sm btn-secondary text-white hover:text-white mr-2 mb-2">공지사항 작성</button>
						</div>

						<c:if test="${!empty allNoticeList}">
							<table class="table w-full">
								<thead>
								<tr class="text-center">
									<th class="text-lg">공지번호</th>
									<th class="text-lg">작성자</th>
									<th class="text-lg">제목</th>
									<th class="text-lg">작성일</th>
									<th class="text-lg">조회수</th>
									<th class="text-lg">수정</th>
									<th class="text-lg">삭제</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="allNotice" items="${allNoticeList}">
									<tr>
										<td class="justify-center items-center text-center">
												${allNotice.noticeNo}
										</td>
										<td class="justify-center items-center text-center">
												${allNotice.writer}
										</td>
										<td class="justify-center items-center text-center">
											<a href="/admin/notice_${allNotice.noticeNo}">${allNotice.title}</a>
										</td>
										<td class="justify-center items-center text-center">
											<fmt:parseDate value="${allNotice.writeDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
											<fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
										</td>
										<td class="justify-center items-center text-center">
												${allNotice.count}
										</td>
										<td>
											<label for="editNotice${allNotice.noticeNo}" class="modal-button cursor-pointer">
												<svg class="w-8 h-8" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><rect fill="none" height="256" width="256"/><circle cx="60" cy="76" fill="none" r="28" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="12"/><circle cx="60" cy="180" fill="none" r="28" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="12"/><line fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="12" x1="136" x2="83.1" y1="128" y2="164.2"/><line fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="12" x1="232" x2="164.3" y1="62.3" y2="108.6"/><line fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="12" x1="232" x2="83.1" y1="193.7" y2="91.8"/></svg>
											</label>
										</td>
										<td>
											<label for="deleteNotice${allNotice.noticeNo}" class="modal-button cursor-pointer">
												<svg class="w-8 h-8" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#101820;}</style></defs><title/>
													<g data-name="Layer 17" id="Layer_17"><path class="cls-1" d="M24,31H8a3,3,0,0,1-3-3V9A1,1,0,0,1,7,9V28a1,1,0,0,0,1,1H24a1,1,0,0,0,1-1V9a1,1,0,0,1,2,0V28A3,3,0,0,1,24,31Z"/><path class="cls-1" d="M28,7H4A1,1,0,0,1,4,5H28a1,1,0,0,1,0,2Z"/><path class="cls-1" d="M20,7a1,1,0,0,1-1-1V3H13V6a1,1,0,0,1-2,0V2a1,1,0,0,1,1-1h8a1,1,0,0,1,1,1V6A1,1,0,0,1,20,7Z"/><path class="cls-1" d="M16,26a1,1,0,0,1-1-1V11a1,1,0,0,1,2,0V25A1,1,0,0,1,16,26Z"/><path class="cls-1" d="M21,24a1,1,0,0,1-1-1V13a1,1,0,0,1,2,0V23A1,1,0,0,1,21,24Z"/><path class="cls-1" d="M11,24a1,1,0,0,1-1-1V13a1,1,0,0,1,2,0V23A1,1,0,0,1,11,24Z"/></g>
												</svg>
											</label>
										</td>
									</tr>

									<%--삭제 모달--%>
									<input type="checkbox" id="deleteNotice${allNotice.noticeNo}" class="modal-toggle"/>
									<div class="modal bg-opacity-60 bg-gray-300">
										<div class="modal-box relative h-2/3 w-5/6 max-w-xl">

											<div class="text-gray-600 mb-6 text-center text-3xl font-bold">삭제</div>

											<div class="flex flex-col py-20 text-center">
												<div class="text-xl text-black">관리자 권한으로 해당 공지사항을 삭제시키겠습니까?</div>
												<div class="text-gray-400">해당 공지사항을 삭제시키면 복구할 수 없습니다.</div>

												<div id="deleteNoticeModal" class="flex flex-row justify-center">
													<div class="modal-action">
														<button type="button" id="yes" onClick="deleteNoticeBtn()"
																class="btn btn-secondary mr-4 hover:bg-purple-600 hover:text-white">yes
														</button>
													</div>

													<label for="deleteNotice${allNotice.noticeNo}"
														   class="btn btn-secondary mt-6 w-[3.5rem] hover:bg-purple-600 hover:text-white">no</label>
												</div>

												<c:if test="${!empty admInfo}">
													<div id="passCheckForDeleteNotice" class="form-control flex flex-row mx-auto space-x-2 my-4">
														<input type="password" id="passCheck" name="passCheck" placeholder="관리자 비밀번호" class="input input-bordered text-lg text-center w-60" />
														<button type="button" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black" onClick="adminPassCheckBtn(${admInfo.admPass}, ${allNotice.noticeNo})">비밀번호 확인</button>
													</div>
												</c:if>
											</div>
										</div>
									</div>
									<!--모달 끝-->

								</c:forEach>
								</tbody>
							</table>
						</c:if>

					</div>

				</div>
			</div>

		</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

	$(document).ready(() => {
		$("#notice_tab").addClass("tab-active");
		$("#noticeManagement").addClass("active");
		$("#passCheckForDeleteNotice").hide();
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

	let searchStatus = function(){
		$("#selectMsg").hide();
	}

	function deleteNoticeBtn(){
		$("#deleteNoticeModal").hide();
		$("#passCheckForDeleteNotice").show();
	}

	function adminPassCheckBtn(admPass, noticeNo){

		let passCheck = $("#passCheck").val();

		$.ajax({
			url: '<c:url value="/admin/adminPassCheck"/>',
			type: 'POST',
			data: JSON.stringify({
				"passCheck": passCheck,
				"admPass": admPass
			}),
			dataType: "json",
			contentType: 'application/json',
			success: function(data) {
				if(data == 1){
					alert("비밀번호가 확인되었습니다.");

					deleteNotice(noticeNo);

				}else if(data == 0){
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		});
	}

	function deleteNotice(noticeNo){

		$.ajax({
			url: '<c:url value="/admin/deleteNotice"/>',
			type: 'POST',
			data: JSON.stringify({
				"noticeNo": noticeNo
			}),
			dataType: "json",
			contentType: 'application/json',
			success: function(data) {
				if(data == 1){
					console.log("공지사항 삭제 성공");

					location.reload();
				}

			}
		});

	}

</script>
</section>

<%@ include file="../common/footer.jsp" %>
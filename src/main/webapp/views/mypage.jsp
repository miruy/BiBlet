<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">

        <%--회원정보 모달--%>
        <input type="checkbox" id="modifyUserInfo" class="modal-toggle"/>
        <div class="modal bg-opacity-60 bg-gray-300">
            <div class="modal-box relative h-5/6 w-11/12 max-w-3xl">

                <label for="modifyUserInfo"
                       class="btn btn-secondary btn-sm btn-circle absolute right-2 top-2 text-gray-600 hover:text-white">✕</label>
                <div class="text-gray-600 mb-6 text-center text-3xl font-bold">회원정보</div>

                <div class="space-y-4 my-[3rem]">
                        <c:if test="${myInfo.storedPic eq null}">
                            <div class="mx-64">
                                <div class="relative w-[12rem] h-[12rem] overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                    <svg class="absolute w-[14rem] h-[14rem] text-gray-400 -left-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${myInfo.storedPic ne null}">
                            <c:set var="idSub" value="${fn:substring(myInfo.id,0,5)}"/>
                            <c:if test="${idSub ne 'kakao'}">
                                <img src="<c:url value='/images/${myInfo.storedPic}'/>" class="mask mask-circle mx-auto w-[12rem] h-[12rem]"/>
                            </c:if>
                            <c:if test="${idSub eq 'kakao'}">
                                <img src="<c:url value='http://${myInfo.storedPic}'/>" class="mask mask-circle mx-auto w-[12rem] h-[12rem]"/>
                            </c:if>
                        </c:if>

                        <div class="overflow-x-auto">
                            <table class="table w-80 mx-auto">
                                <tbody>
                                <c:set var="idSub" value="${fn:substring(myInfo.id,0,5)}"/>
                                <c:if test="${idSub ne 'kakao'}">
                                    <tr>
                                        <th class="text-xl font-semibold">Name</th>
                                        <td class="text-lg text-center">${myInfo.name}</td>
                                    </tr>

                                    <tr>
                                        <th class="text-xl font-semibold">ID</th>
                                        <td class="text-lg text-center">${myInfo.id}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-xl font-semibold">Email</th>
                                        <td class="text-lg text-center">${myInfo.email}</td>
                                    </tr>
                                </c:if>

                                <c:if test="${idSub eq 'kakao'}">
                                    <tr>
                                        <th class="text-xl font-semibold">Name</th>
                                        <td class="text-lg text-center">${myInfo.name}</td>
                                    </tr>

                                    <tr>
                                        <td class="text-gray-400">카카오로그인 회원입니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                </div>

                <div class="flex justify-center items-center">
                    <c:set var="idSub" value="${fn:substring(myInfo.id,0,5)}"/>
                    <c:if test="${idSub ne 'kakao'}">
                        <div class="modal-action">
                            <button type="button" id="edit" onClick="infoUpdate()"
                                    class="btn btn-secondary mr-4 hover:bg-purple-600 hover:text-white">회원정보 수정
                            </button>
                        </div>
                    </c:if>
                    <div class="modal-action">
                        <button type="button" id="delete" onClick="infoDelete()"
                                class="btn btn-secondary hover:bg-purple-600 hover:text-white">회원 탈퇴
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--모달 끝-->

        <div class="card w-full bg-gray-100 shadow-xl">

            <div class="flex justify-between p-16">
                <div class="flex flex-row space-x-4">
                    <div class="">
                        <c:if test="${myInfo.storedPic eq null}">
                            <div class="relative w-14 h-14 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                <svg class="absolute w-16 h-16 text-gray-400 pr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                            </div>
                        </c:if>
                        <c:if test="${myInfo.storedPic ne null}">
                            <c:set var="idSub" value="${fn:substring(myInfo.id,0,5)}"/>
                            <c:if test="${idSub ne 'kakao'}">
                                <img src="<c:url value='/images/${myInfo.storedPic}'/>" class="mask mask-circle w-14 h-14"/>
                            </c:if>
                            <c:if test="${idSub eq 'kakao'}">
                                <img src="<c:url value='http://${myInfo.storedPic}'/>" class="mask mask-circle w-14 h-14"/>
                            </c:if>
                        </c:if>
                    </div>

                    <div class="pt-4">
                        <c:if test="${idSub ne 'kakao'}">
                            <div class="text-xl">${myInfo.id}</div>
                        </c:if>
                        <c:if test="${idSub eq 'kakao'}">
                            <div class="text-xl">${myInfo.name}</div>
                        </c:if>
                    </div>
                </div>

                <label for="modifyUserInfo" class="modal-button">
                    <svg id="Layer_1" class="cursor-pointer" height="30" width="30"
                         style="enable-background:new 0 0 48 48;" version="1.1"
                         viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                        <path d="M24,11c-7.2,0-13,5.8-13,13c0,7.2,5.8,13,13,13c7.2,0,13-5.8,13-13C37,16.8,31.2,11,24,11z M24,35c-6.1,0-11-4.9-11-11   s4.9-11,11-11s11,4.9,11,11S30.1,35,24,35z"/>
                        <path d="M44,20h-2.4c-0.5-2.1-1.3-4-2.3-5.6l1.6-1.8c1.2-1.2,1.2-3,0-4.2L39.5,7c-1.2-1.2-3.1-1.2-4.2,0l-1.8,1.8   c-1.8-1.2-3.6-1.9-5.6-2.3V4c0-1.7-1.3-3-3-3h-2c-1.7,0-3,1.3-3,3v2.5c-1.9,0.4-3.8,1.2-5.6,2.3l-1.7-1.7c-1.2-1.2-3-1.2-4.2,0   L7,8.5c-0.6,0.6-0.9,1.3-0.9,2.1s0.3,1.5,0.9,2.1l1.8,1.7c-1.1,1.8-1.9,3.6-2.3,5.6H4c-1.7,0-3,1.3-3,3v2c0,1.7,1.3,3,3,3h2.5   c0.4,1.9,1.2,3.8,2.4,5.6l-1.7,1.8c-1.2,1.2-1.2,3,0,4.2L8.5,41c1.2,1.2,3,1.2,4.2,0l1.7-1.8c1.8,1.1,3.6,1.9,5.6,2.3V44   c0,1.7,1.3,3,3,3h2c1.7,0,3-1.3,3-3v-2.4c2.1-0.5,3.9-1.3,5.6-2.3l1.7,1.6c1.2,1.2,3,1.2,4.2,0l1.4-1.4c1.2-1.2,1.2-3,0-4.2   l-1.7-1.7c1.2-1.8,1.9-3.6,2.3-5.6H44c1.7,0,3-1.3,3-3v-2C47,21.3,45.7,20,44,20z M45,25c0,0.6-0.4,1-1,1h-4.2l-0.1,0.8   c-0.4,2.2-1.2,4.3-2.6,6.3l-0.5,0.7l2.9,2.9c0.2,0.2,0.3,0.4,0.3,0.7c0,0.3-0.1,0.5-0.3,0.7l-1.4,1.4c-0.4,0.4-1,0.4-1.4,0   l-2.9-2.8l-0.7,0.5c-1.8,1.3-3.9,2.2-6.3,2.6L26,40v4c0,0.6-0.4,1-1,1h-2c-0.6,0-1-0.4-1-1v-4.2l-0.8-0.1c-2.2-0.4-4.3-1.2-6.3-2.6   l-0.7-0.5l-2.9,3c-0.4,0.4-1,0.4-1.4,0l-1.4-1.4c-0.4-0.4-0.4-1,0-1.4l2.9-3l-0.5-0.7c-1.4-2-2.3-4.1-2.6-6.3L8.2,26H4   c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h4.2l0.1-0.8c0.4-2.2,1.2-4.3,2.6-6.3l0.5-0.7l-3-2.9c-0.2-0.2-0.3-0.4-0.3-0.7   s0.1-0.5,0.3-0.7l1.4-1.4c0.4-0.4,1-0.4,1.4,0l2.9,2.9l0.7-0.5c1.9-1.4,4.1-2.3,6.3-2.6l0.8-0.1V4c0-0.6,0.4-1,1-1h2   c0.6,0,1,0.4,1,1v4.2l0.8,0.1c2.2,0.4,4.3,1.2,6.3,2.6l0.7,0.5l3-3c0.4-0.4,1-0.4,1.4,0l1.4,1.4c0.4,0.4,0.4,1,0,1.4l-2.7,3   l0.5,0.7c1.2,1.8,2.1,3.9,2.6,6.3L40,22h4c0.6,0,1,0.4,1,1V25z"/>
                    </g></svg>
                </label>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <div class="flex-col flex-row mb-4">
                    <span class="text-xl mr-2">읽고싶어요</span>
                    <a class="text-gray-400" href="/mypage_1"> > 더보기 </a>
                </div>
                <div class="w-full relative flex items-center justify-center">

                    <div id="wantReadList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                        <div id="wantReadBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                    </div>

                </div>

                <template id="template__wantReadDetail__link">
                    <a href='{wantReadDetail__link}' class="list-none flex flex-shrink-0">
                        <img class='h-64 w-44 shadow-xl rounded-lg' src='{wantReadBook_thumbnail}'/>
                    </a>
                </template>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <div class="flex-col flex-row  mb-4">
                    <span class="text-xl mr-2">읽는 중</span>
                    <a class="text-gray-400" href="/mypage_2"> > 더보기 </a>
                </div>
                <div class="w-full relative flex items-center justify-center">

                    <div id="readingList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                        <div id="readingBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                    </div>

                </div>

                <template id="template__readingDetail__link">
                    <a href='{readingDetail__link}' class="list-none flex flex-shrink-0">
                        <img class='h-64 w-44 shadow-xl rounded-lg' src='{readingBook_thumbnail}'/>
                    </a>
                </template>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <div class="flex-col flex-row  mb-4">
                    <span class="text-xl mr-2">나의 코멘트</span>
                    <a class="text-gray-400" href="/mypage_3"> > 더보기 </a>
                </div>
                <div class="carousel carousel-center space-x-4 w-pull bg-gray-100">
                    <c:if test="${!empty myComments}">
                        <c:forEach var="myComment" items="${myComments}">
                            <div class="carousel-item rounded-lg bg-white w-85 h-79 flex flex-col">
                                <div class="p-4 space-x-2">
                                    <div class="flex flex-row border-b-2 border-gray-300 my-2 pl-12 pr-10">
                                        <div id="title${myComment.isbn}"></div>
                                    </div>
                                    <textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2"
                                              rows="7"
                                              id="content${myComment.appraisalNo}"
                                              disabled>${myComment.comment}</textarea>
                                    <c:if test="${!empty myComment.startDate}">
                                        <div class="flex flex-row">
                                            <svg enable-background="new 0 0 32 32" height="20" id="Layer_1"
                                                 version="1.1" viewBox="0 0 32 32" width="20" xml:space="preserve"
                                                 xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <g id="calendar_1_">
                                                    <path d="M29.334,3H25V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v2h-6V1c0-0.553-0.448-1-1-1s-1,0.447-1,1v2H9V1   c0-0.553-0.448-1-1-1S7,0.447,7,1v2H2.667C1.194,3,0,4.193,0,5.666v23.667C0,30.806,1.194,32,2.667,32h26.667   C30.807,32,32,30.806,32,29.333V5.666C32,4.193,30.807,3,29.334,3z M30,29.333C30,29.701,29.701,30,29.334,30H2.667   C2.299,30,2,29.701,2,29.333V5.666C2,5.299,2.299,5,2.667,5H7v2c0,0.553,0.448,1,1,1s1-0.447,1-1V5h6v2c0,0.553,0.448,1,1,1   s1-0.447,1-1V5h6v2c0,0.553,0.447,1,1,1s1-0.447,1-1V5h4.334C29.701,5,30,5.299,30,5.666V29.333z"
                                                          fill="#333332"/>
                                                    <rect fill="#333332" height="3" width="4" x="7" y="12"/>
                                                    <rect fill="#333332" height="3" width="4" x="7" y="17"/>
                                                    <rect fill="#333332" height="3" width="4" x="7" y="22"/>
                                                    <rect fill="#333332" height="3" width="4" x="14" y="22"/>
                                                    <rect fill="#333332" height="3" width="4" x="14" y="17"/>
                                                    <rect fill="#333332" height="3" width="4" x="14" y="12"/>
                                                    <rect fill="#333332" height="3" width="4" x="21" y="22"/>
                                                    <rect fill="#333332" height="3" width="4" x="21" y="17"/>
                                                    <rect fill="#333332" height="3" width="4" x="21" y="12"/>
                                                </g>
                                            </svg>
                                            <div class="ml-2 pr-2 text-gray-600" id="startDate${myComment.appraisalNo}"> ${myComment.startDate}</div>
                                            ~
                                            <div class="ml-3 text-gray-600" id="endDate${myComment.appraisalNo}">${myComment.endDate}</div>
                                        </div>
                                    </c:if>
                                    <div class="flex flex-row pt-1">
                                        <svg id="Layer_1" class="mr-2" width="22" height="22"
                                             style="enable-background:new 0 0 48 48;" version="1.1"
                                             viewBox="0 0 48 48"
                                             xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                             xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <g>
                                                <path d="M24,46C11.9,46,2,36.1,2,24S11.9,2,24,2s22,9.9,22,22S36.1,46,24,46z M24,4C13,4,4,13,4,24c0,11,9,20,20,20   c11,0,20-9,20-20C44,13,35,4,24,4z"/>
                                            </g>
                                            <g>
                                                <polygon points="20,34.1 11.3,25.4 12.7,23.9 20,31.2 35.3,15.9 36.7,17.4  "/>
                                            </g>
                                        </svg>
                                        ${myComment.coPrv}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <div class="flex-col flex-row  mb-4">
                    <span class="text-xl mr-2">나의 평가</span>
                    <a class="text-gray-400" href="/mypage_4"> > 더보기 </a>
                </div>
                <div id="myEvaluateList" class="flex space-x-4 mt-2"></div>
            </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <script>

                $(document).ready(function () {
                    // 나의 코멘트
                    <c:if test="${!empty myComments}">
                    <c:forEach var="myComment" items="${myComments}">
                    myComments(${myComment.isbn})
                    </c:forEach>
                    </c:if>

                    // 나의 평가
                    <c:if test="${!empty myEvaluateList}">
                    <c:forEach var="myEvaluate" items="${myEvaluateList}">
                    myEvaluateList(${myEvaluate.isbn}, ${myEvaluate.star})
                    </c:forEach>
                    </c:if>
                })

                function infoUpdate(storedPic, ){
                    // 확인 팝업 창
                    if(confirm("수정하시겠습니까?")){
                        location.href = "/edit";
                    }
                }

                function infoDelete(){
                    // 확인 팝업 창
                    if(confirm("탈퇴하시겠습니까?")){
                        location.href = "/delete";
                    }
                }

                function myComments(isbn) {
                    var pageNum = 1;
                    var isbn_query = isbn;
                    console.log("isbn_query:" + isbn_query);
                    $.ajax({	//카카오 검색요청 / [요청]
                        method: "GET",
                        url: "https://dapi.kakao.com/v3/search/book",
                        data: {query: isbn_query, page: pageNum},
                        headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
                    })

                        .done(function (msg) {	//검색 결과 담기 / [응답]
                            console.log(msg);
                            let title = msg.documents[0].title;
                            let subTitle = '';

                            if (title.length > 15) {
                                subTitle = title.substring(0, 14);
                                console.log(subTitle);
                                $("#title" + isbn).append("<a href='/read/" + isbn + "'>" + subTitle + "...</a>");
                            } else if (title.length < 15) {
                                $("#title" + isbn).append("<a href='/read/" + isbn + "'>" + msg.documents[0].title + "</a>");
                            }

                        });
                }

                // 나의 평가
                function myEvaluateList(isbn, star) {
                    var pageNum = 1;
                    var isbn_query = isbn;
                    var starP = '';
                    console.log("isbn_query:" + isbn_query);
                    console.log("star : " + star);

                    $.ajax({	//카카오 검색요청 / [요청]
                        method: "GET",
                        traditional: true,
                        async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                        url: "https://dapi.kakao.com/v3/search/book",
                        data: {query: isbn_query, page: pageNum},
                        headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
                    })

                        .done(function (msg) {	//검색 결과 담기 / [응답]

                            if (star == 0) {
                                starP = '☆☆☆☆☆';
                            } else if (star == 1) {
                                starP = '★☆☆☆☆';
                            } else if (star == 2) {
                                starP = '★★☆☆☆';
                            } else if (star == 3) {
                                starP = '★★★☆☆';
                            } else if (star == 4) {
                                starP = '★★★★☆';
                            } else if (star == 5) {
                                starP = '★★★★★';
                            }

                            var html = '';
                            html += '<div>';
                            html += '<a href="/read/' + isbn + '"><img class="w-44 h-64 shadow-xl rounded-lg" src="' + msg.documents[0].thumbnail + '"/></a>';
                            html += '<div class="text-yellow-400 text-3xl text-center">' + starP + '</div>';
                            html += '</div>';

                            $("#myEvaluateList").append(html);
                        });
                }

                // 읽고싶은 도서 5개
                function wantReadList() {
                    const isbns = ${wantReadList};
                    console.log(isbns);

                    isbns.map(isbn => {
                        $.ajax({	//카카오 검색요청 / [요청]
                            method: "GET",
                            traditional: true,
                            async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                            url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                            data: {query: isbn},
                            headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
                        })
                            .done(function (data) {	//검색 결과 담기 / [응답]
                                const book = data.documents[0];
                                const isbn = book.isbn.slice(-13);
                                const thumbnailLink = book.thumbnail;

                                console.log("thumbnailLink : " + thumbnailLink);

                                const result = $("#template__wantReadDetail__link").html()
                                    .replace("{wantReadDetail__link}", "/read/" + isbn)
                                    .replace("{wantReadBook_thumbnail}", thumbnailLink);

                                $("#wantReadBook__detail").append(result);
                            });
                    })
                }

                wantReadList();

                // 읽는 중 도서 5개
                function readingList() {
                    const isbns = ${readingList};
                    console.log(isbns);

                    isbns.map(isbn => {
                        $.ajax({	//카카오 검색요청 / [요청]
                            method: "GET",
                            traditional: true,
                            async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                            url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                            data: {query: isbn},
                            headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
                        })
                            .done(function (data) {	//검색 결과 담기 / [응답]
                                const book = data.documents[0];
                                const isbn = book.isbn.slice(-13);
                                const thumbnailLink = book.thumbnail;

                                console.log("thumbnailLink : " + thumbnailLink);

                                const result = $("#template__readingDetail__link").html()
                                    .replace("{readingDetail__link}", "/read/" + isbn)
                                    .replace("{readingBook_thumbnail}", thumbnailLink);

                                $("#readingBook__detail").append(result);
                            });
                    })
                }

                readingList();


            </script>

</section>

<%@ include file="common/footer.jsp" %>
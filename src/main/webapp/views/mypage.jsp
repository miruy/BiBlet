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
                                <svg class="absolute w-[14rem] h-[14rem] text-gray-400 -left-4" fill="currentColor"
                                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${myInfo.storedPic ne null}">
                        <c:set var="idSub" value="${fn:substring(myInfo.id,0,5)}"/>
                        <c:if test="${idSub ne 'kakao'}">
                            <img src="<c:url value='/images/${myInfo.storedPic}'/>"
                                 class="mask mask-circle mx-auto w-[12rem] h-[12rem]"/>
                        </c:if>
                        <c:if test="${idSub eq 'kakao'}">
                            <img src="<c:url value='http://${myInfo.storedPic}'/>"
                                 class="mask mask-circle mx-auto w-[12rem] h-[12rem]"/>
                        </c:if>
                    </c:if>

                    <div class="overflow-x-auto">
                        <table class="table w-80 mx-auto mt-4">
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
                                <tr>
                                    <th class="text-xl font-semibold">Date</th>
                                    <td class="text-lg text-center">
                                        <fmt:parseDate value="${myInfo.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                                    </td>
                                </tr>
                            </c:if>

                            <c:if test="${idSub eq 'kakao'}">
                                <tr>
                                    <th class="text-xl font-semibold">Name</th>
                                    <td class="text-lg text-center">${myInfo.name}</td>
                                </tr>
                                <tr>
                                    <th class="text-xl font-semibold">Date</th>
                                    <td class="text-lg text-center">
                                        <fmt:parseDate value="${myInfo.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>

                                <div class="text-gray-400 text-center">카카오 로그인 회원입니다.</div>
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
                                <svg class="absolute w-16 h-16 text-gray-400 pr-2" fill="currentColor"
                                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${myInfo.storedPic ne null}">
                            <c:set var="idSub" value="${fn:substring(myInfo.id,0,5)}"/>
                            <c:if test="${idSub ne 'kakao'}">
                                <img src="<c:url value='/images/${myInfo.storedPic}'/>"
                                     class="mask mask-circle w-14 h-14"/>
                            </c:if>
                            <c:if test="${idSub eq 'kakao'}">
                                <img src="<c:url value='http://${myInfo.storedPic}'/>"
                                     class="mask mask-circle w-14 h-14"/>
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

                    <svg id="Layer_1" class="cursor-pointer w-10 h-10" viewBox="0 0 21 21"
                         xmlns="http://www.w3.org/2000/svg">
                        <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round"
                           stroke-linejoin="round" transform="translate(3 3)">
                            <path d="m7.5.5c.35132769 0 .69661025.02588228 1.03404495.07584411l.50785434 1.53911115c.44544792.12730646.86820077.30839026 1.26078721.53578009l1.4600028-.70360861c.5166435.39719686.9762801.86487779 1.3645249 1.388658l-.7293289 1.44720284c.2201691.39604534.3936959.82158734.5131582 1.2692035l1.5298263.5338186c.0390082.29913986.0591302.60421522.0591302.91399032 0 .35132769-.0258823.69661025-.0758441 1.03404495l-1.5391112.50785434c-.1273064.44544792-.3083902.86820077-.5357801 1.26078721l.7036087 1.4600028c-.3971969.5166435-.8648778.9762801-1.388658 1.3645249l-1.4472029-.7293289c-.39604532.2201691-.82158732.3936959-1.26920348.5131582l-.5338186 1.5298263c-.29913986.0390082-.60421522.0591302-.91399032.0591302-.35132769 0-.69661025-.0258823-1.03404495-.0758441l-.50785434-1.5391112c-.44544792-.1273064-.86820077-.3083902-1.26078723-.5357801l-1.46000277.7036087c-.51664349-.3971969-.97628006-.8648778-1.36452491-1.388658l.72932886-1.4472029c-.2203328-.39633993-.39395403-.82222042-.51342462-1.27020241l-1.52968981-.53381682c-.03892294-.29882066-.05900023-.60356226-.05900023-.91299317 0-.35132769.02588228-.69661025.07584411-1.03404495l1.53911115-.50785434c.12730646-.44544792.30839026-.86820077.53578009-1.26078723l-.70360861-1.46000277c.39719686-.51664349.86487779-.97628006 1.388658-1.36452491l1.44720284.72932886c.39633995-.2203328.82222044-.39395403 1.27020243-.51342462l.53381682-1.52968981c.29882066-.03892294.60356226-.05900023.91299317-.05900023z"
                                  stroke-width=".933"/>
                            <circle cx="7.5" cy="7.5" r="3"/>
                        </g>
                    </svg>
                </label>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <c:if test="${!empty wantReadList}">
                    <div class="flex-col flex-row mb-4">
                        <span class="text-xl mr-2">읽고싶어요</span>
                        <a class="text-gray-400" href="/wantRead"> > 더보기 </a>
                    </div>
                </c:if>
                <c:if test="${empty wantReadList}">
                    <div class="flex-col flex-row mb-4">
                        <span class="text-xl mr-2">읽고싶어요</span>
                        <a class="text-gray-400" onclick="alert('아직 읽고싶은 도서가 없네요 :(')"> > 더보기 </a>
                    </div>
                </c:if>
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
                <c:if test="${!empty readingList}">
                    <div class="flex-col flex-row  mb-4">
                        <span class="text-xl mr-2">읽는 중</span>
                        <a class="text-gray-400" href="/reading"> > 더보기 </a>
                    </div>
                </c:if>
                <c:if test="${empty readingList}">
                    <div class="flex-col flex-row  mb-4">
                        <span class="text-xl mr-2">읽는 중</span>
                        <a class="text-gray-400" onclick="alert('아직 읽는 중인 도서가 없네요 :(')"> > 더보기 </a>
                    </div>
                </c:if>
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
                <c:if test="${!empty myComments}">
                    <div class="flex-col flex-row  mb-4">
                        <span class="text-xl mr-2">나의 코멘트</span>
                        <a class="text-gray-400" href="/myComment"> > 더보기 </a>
                    </div>
                </c:if>
                <c:if test="${empty myComments}">
                    <div class="flex-col flex-row  mb-4">
                        <span class="text-xl mr-2">나의 코멘트</span>
                        <a class="text-gray-400" onclick="alert('아직 작성하신 코멘트가 없네요 :(')"> > 더보기 </a>
                    </div>
                </c:if>
                <div class="carousel carousel-center space-x-4 w-pull bg-gray-100">
                    <c:if test="${!empty myComments}">
                        <c:forEach var="myComment" items="${myComments}">
                            <div class="carousel-item rounded-lg bg-white w-85 h-79 flex flex-col">
                                <div class="p-4 space-x-2">
                                    <div class="flex flex-row border-b-2 border-gray-300 my-2 pl-12 pr-10">
                                        <div id="title${myComment.isbn}"></div>
                                    </div>
                                    <c:if test="${myComment.active == 0}">
                                        <textarea class="text-gray-800 text-center box-content bg-white w-64 resize-none mt-2">해당 코멘트는 권리자 권한으로 표시가 중지되었습니다.</textarea>
                                    </c:if>
                                    <c:if test="${myComment.active == 1}">
                                        <textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2"
                                                  rows="7"
                                                  id="content${myComment.appraisalNo}"
                                                  disabled>${myComment.comment}
                                        </textarea>
                                    </c:if>
                                    <div class="flex flex-col">
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
                                                <div class="ml-2 pr-2 text-gray-600"
                                                     id="startDate${myComment.appraisalNo}"> ${myComment.startDate}</div>
                                                ~
                                                <div class="ml-3 text-gray-600"
                                                     id="endDate${myComment.appraisalNo}">${myComment.endDate}</div>
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
                                                    <polygon
                                                            points="20,34.1 11.3,25.4 12.7,23.9 20,31.2 35.3,15.9 36.7,17.4  "/>
                                                </g>
                                            </svg>
                                                ${myComment.coPrv}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <c:if test="${!empty myEvaluateList}">
                    <div class="flex-col flex-row  mb-4">
                        <span class="text-xl mr-2">나의 평가</span>
                        <a class="text-gray-400" href="/myEvaluate"> > 더보기 </a>
                    </div>
                </c:if>
                <c:if test="${empty myEvaluateList}">
                    <div class="flex-col flex-row  mb-4">
                        <span class="text-xl mr-2">나의 평가</span>
                        <a class="text-gray-400" onclick="alert('평가한 도서가 아직 없네요 :(')"> > 더보기 </a>
                    </div>
                </c:if>
                <div id="myEvaluateList" class="flex space-x-4 mt-2"></div>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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

            function infoUpdate(storedPic,) {
                // 확인 팝업 창
                if (confirm("수정하시겠습니까?")) {
                    location.href = "/edit";
                }
            }

            function infoDelete() {
                // 확인 팝업 창
                if (confirm("탈퇴하시겠습니까?")) {
                    location.href = "/withdraw";
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
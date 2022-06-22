<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">
        <div class="card w-full bg-gray-100 shadow-xl">
            <div class="flex p-16 justify-between">
                <div class="flex flex-row space-x-2">
                    <div class="text-2xl">${profile}</div>
                    <div class="text-xl">${id}</div>
                    <span class="text-xl">님의 My Page 입니다 :)</span>
                </div>
                <div>
                    <a href="/">
                        <svg id="Layer_1" height="30" width="30" style="enable-background:new 0 0 48 48;" version="1.1"
                             viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                            <path d="M24,11c-7.2,0-13,5.8-13,13c0,7.2,5.8,13,13,13c7.2,0,13-5.8,13-13C37,16.8,31.2,11,24,11z M24,35c-6.1,0-11-4.9-11-11   s4.9-11,11-11s11,4.9,11,11S30.1,35,24,35z"/>
                            <path d="M44,20h-2.4c-0.5-2.1-1.3-4-2.3-5.6l1.6-1.8c1.2-1.2,1.2-3,0-4.2L39.5,7c-1.2-1.2-3.1-1.2-4.2,0l-1.8,1.8   c-1.8-1.2-3.6-1.9-5.6-2.3V4c0-1.7-1.3-3-3-3h-2c-1.7,0-3,1.3-3,3v2.5c-1.9,0.4-3.8,1.2-5.6,2.3l-1.7-1.7c-1.2-1.2-3-1.2-4.2,0   L7,8.5c-0.6,0.6-0.9,1.3-0.9,2.1s0.3,1.5,0.9,2.1l1.8,1.7c-1.1,1.8-1.9,3.6-2.3,5.6H4c-1.7,0-3,1.3-3,3v2c0,1.7,1.3,3,3,3h2.5   c0.4,1.9,1.2,3.8,2.4,5.6l-1.7,1.8c-1.2,1.2-1.2,3,0,4.2L8.5,41c1.2,1.2,3,1.2,4.2,0l1.7-1.8c1.8,1.1,3.6,1.9,5.6,2.3V44   c0,1.7,1.3,3,3,3h2c1.7,0,3-1.3,3-3v-2.4c2.1-0.5,3.9-1.3,5.6-2.3l1.7,1.6c1.2,1.2,3,1.2,4.2,0l1.4-1.4c1.2-1.2,1.2-3,0-4.2   l-1.7-1.7c1.2-1.8,1.9-3.6,2.3-5.6H44c1.7,0,3-1.3,3-3v-2C47,21.3,45.7,20,44,20z M45,25c0,0.6-0.4,1-1,1h-4.2l-0.1,0.8   c-0.4,2.2-1.2,4.3-2.6,6.3l-0.5,0.7l2.9,2.9c0.2,0.2,0.3,0.4,0.3,0.7c0,0.3-0.1,0.5-0.3,0.7l-1.4,1.4c-0.4,0.4-1,0.4-1.4,0   l-2.9-2.8l-0.7,0.5c-1.8,1.3-3.9,2.2-6.3,2.6L26,40v4c0,0.6-0.4,1-1,1h-2c-0.6,0-1-0.4-1-1v-4.2l-0.8-0.1c-2.2-0.4-4.3-1.2-6.3-2.6   l-0.7-0.5l-2.9,3c-0.4,0.4-1,0.4-1.4,0l-1.4-1.4c-0.4-0.4-0.4-1,0-1.4l2.9-3l-0.5-0.7c-1.4-2-2.3-4.1-2.6-6.3L8.2,26H4   c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h4.2l0.1-0.8c0.4-2.2,1.2-4.3,2.6-6.3l0.5-0.7l-3-2.9c-0.2-0.2-0.3-0.4-0.3-0.7   s0.1-0.5,0.3-0.7l1.4-1.4c0.4-0.4,1-0.4,1.4,0l2.9,2.9l0.7-0.5c1.9-1.4,4.1-2.3,6.3-2.6l0.8-0.1V4c0-0.6,0.4-1,1-1h2   c0.6,0,1,0.4,1,1v4.2l0.8,0.1c2.2,0.4,4.3,1.2,6.3,2.6l0.7,0.5l3-3c0.4-0.4,1-0.4,1.4,0l1.4,1.4c0.4,0.4,0.4,1,0,1.4l-2.7,3   l0.5,0.7c1.2,1.8,2.1,3.9,2.6,6.3L40,22h4c0.6,0,1,0.4,1,1V25z"/>
                        </g></svg>
                    </a>
                </div>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <span class="text-xl mb-4">읽고싶어요</span>

                <div class="w-full relative flex items-center justify-center">

                    <div id="wantReadList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                        <div id="wantReadBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                    </div>

                </div>

                <template id="template__wantReadDetail__link">
                    <a href='{wantReadDetail__link}' class="list-none flex flex-shrink-0">
                        <img class='h-64 w-44' src='{wantReadBook_thumbnail}'/>
                    </a>
                </template>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <span class="text-xl mb-4">읽는 중</span>

                <div class="w-full relative flex items-center justify-center">

                    <div id="readingList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                        <div id="readingBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                    </div>

                </div>

                <template id="template__readingDetail__link">
                    <a href='{readingDetail__link}' class="list-none flex flex-shrink-0">
                        <img class='h-64 w-44' src='{readingBook_thumbnail}'/>
                    </a>
                </template>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <span class="text-xl mb-4">나의 코멘트</span>
                <div class="carousel carousel-center space-x-4 w-pull bg-gray-100">
                    <c:if test="${!empty myComments}">
                        <c:forEach var="myComment" items="${myComments}">
                            <div class="carousel-item rounded-lg bg-white w-85 h-79 flex flex-col">
                                <div class="p-4 space-x-4">
                                    <div class="flex flex-row border-b-2 border-gray-300 my-2">
                                        <div id="title${myComment.isbn}"></div>
                                    </div>
                                    <textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2" rows="7"
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
                                            <div class="ml-2 pr-2 text-gray-600" id="startDate${myComment.appraisalNo}">
                                                    ${myComment.startDate}
                                            </div>
                                            ~
                                            <div class="ml-3 text-gray-600" id="endDate${myComment.appraisalNo}">
                                                    ${myComment.endDate}
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="flex flex-row pt-1">
                                        <svg id="Layer_1" class="mr-2" width="22" height="22" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M24,46C11.9,46,2,36.1,2,24S11.9,2,24,2s22,9.9,22,22S36.1,46,24,46z M24,4C13,4,4,13,4,24c0,11,9,20,20,20   c11,0,20-9,20-20C44,13,35,4,24,4z"/></g><g><polygon points="20,34.1 11.3,25.4 12.7,23.9 20,31.2 35.3,15.9 36.7,17.4  "/></g></svg>
                                            ${myComment.coPrv}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>

            <div class="flex flex-col mb-20 px-10">
                <span class="text-xl mb-4">나의 평가</span>
                    <div id="myEvaluateList" class="flex space-x-4">
            </div>

            <div>
                여기는 마이페이지


                리스트
                나의 읽고싶어요
                책 표지 5개 미리보기

                나의 읽는 중
                책 표지 5개 미리보기

                나의 코멘트
                댓글 캐러셀모양으로 책 제목, 코멘트, 기간

                나의 평가
                책 표지 5개, 밑에 별점 미리보기

                위에
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
                        myEvaluateList(${myEvaluate.isbn},${myEvaluate.star} )
                    </c:forEach>
                </c:if>
            })

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
                        $("#title" + isbn).append("<a href='/read/" + isbn + "' class='text-center'>" + msg.documents[0].title + "</a>");
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
                            html += '<a href="/read/' + isbn + '"><img class="w-44 h-64" src="' + msg.documents[0].thumbnail + '"/></a>';
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
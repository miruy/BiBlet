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
                        <svg height="32px" id="Layer_1" version="1.1" viewBox="0 0 32 32" width="32px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <path d="M30,16c0-1.969-1.431-3.611-3.307-3.94l-0.347-0.835c1.095-1.56,0.945-3.731-0.447-5.124   c-1.346-1.346-3.599-1.521-5.125-0.448l-0.835-0.346C19.61,3.431,17.969,2,16,2c-1.969,0-3.611,1.431-3.94,3.307l-0.835,0.346   C9.667,4.56,7.494,4.708,6.101,6.101c-0.756,0.755-1.172,1.76-1.172,2.829c0,0.833,0.253,1.628,0.724,2.296L5.307,12.06   C3.43,12.389,2,14.031,2,16c0,0,0,0,0,0s0,0,0,0c0,1.97,1.431,3.611,3.307,3.94l0.346,0.834c-1.094,1.561-0.945,3.732,0.448,5.125   c1.344,1.345,3.601,1.521,5.125,0.448l0.835,0.346c0.329,1.876,1.971,3.307,3.94,3.307c1.97,0,3.611-1.431,3.939-3.307l0.835-0.347   c1.559,1.095,3.73,0.947,5.125-0.447c0.756-0.756,1.172-1.76,1.172-2.829c0-0.833-0.254-1.628-0.724-2.296l0.346-0.834   C28.569,19.612,30,17.971,30,16C30,16.001,30,16.001,30,16C30,16,30,16,30,16z M26,18.002c-0.404,0-0.769,0.243-0.924,0.617   l-0.808,1.948c-0.155,0.374-0.069,0.804,0.217,1.09c0.378,0.378,0.586,0.88,0.586,1.414c0,0.535-0.208,1.037-0.586,1.415   c-0.78,0.78-2.051,0.778-2.829,0c-0.286-0.286-0.716-0.372-1.09-0.217l-1.949,0.808C18.243,25.232,18,25.597,18,26.001   c0,1.103-0.897,2-2,2c-1.103,0-2-0.897-2-2c0-0.404-0.244-0.77-0.617-0.924l-1.95-0.808c-0.375-0.155-0.803-0.069-1.09,0.217   c-0.756,0.756-2.072,0.756-2.828,0c-0.78-0.78-0.78-2.049,0-2.829c0.286-0.286,0.372-0.716,0.217-1.09l-0.808-1.948   C6.769,18.245,6.404,18.002,6,18.002c-1.103,0-2-0.897-2-2.001c0,0,0,0,0,0s0,0,0,0c0-1.103,0.897-2,2-2   c0.404,0,0.769-0.244,0.924-0.617l0.808-1.95c0.155-0.374,0.069-0.804-0.217-1.09c-0.378-0.378-0.586-0.88-0.586-1.414   c0-0.534,0.208-1.037,0.586-1.415c0.78-0.78,2.049-0.78,2.829,0c0.286,0.286,0.716,0.37,1.09,0.217l1.949-0.808   C13.756,6.769,14,6.404,14,6c0-1.103,0.897-2,2-2c1.103,0,2,0.897,2,2c0,0.404,0.244,0.769,0.617,0.924l1.95,0.808   c0.374,0.154,0.804,0.07,1.09-0.217c0.756-0.756,2.072-0.756,2.828,0c0.779,0.78,0.779,2.049,0,2.829   c-0.286,0.286-0.372,0.716-0.217,1.09l0.808,1.95C25.23,13.756,25.596,14,26,14c1.103,0,2,0.897,2,2c0,0,0,0,0,0s0,0,0,0   C28,17.104,27.103,18.002,26,18.002z"/><path d="M16,11c-2.757,0-5,2.243-5,5s2.243,5,5,5c0.552,0,1-0.447,1-1s-0.448-1-1-1c-1.654,0-3-1.346-3-3s1.346-3,3-3s3,1.346,3,3   c0,0.582-0.166,1.146-0.481,1.632c-0.301,0.463-0.169,1.082,0.295,1.383c0.463,0.301,1.082,0.17,1.383-0.295   C20.722,17.91,21,16.969,21,16C21,13.243,18.757,11,16,11z"/>
                        </svg>
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

            <div class="carousel carousel-center pl-4 pb-4 space-x-2 w-pull bg-gray-100">
                <c:if test="${!empty commentsByMembers}">
                    <c:forEach var="comment" items="${commentsByMembers}">
                        <div class="carousel-item rounded-lg bg-white w-80 h-72 flex flex-col">
                            <div class="p-4 space-x-4">
                                <div class="flex flex-row border-b-2 border-gray-300 mt-2">
                                    <div class="ml-4 mr-2 text-gray-600">${comment.originPic}</div>

                                    <c:set var="idSub" value="${fn:substring(comment.id,0,5)}" />
                                    <c:if test="${idSub ne 'kakao'}">
                                        <div class="text-gray-600 text-sm">${comment.id}</div>
                                    </c:if>

                                    <c:if test="${idSub eq 'kakao'}">
                                        <div class="text-gray-600 text-sm">${comment.name}</div>
                                    </c:if>

                                    <div id="star${comment.id}"></div>
                                </div>

                                <div class="border-b-2 border-gray-300 py-2">
                                        <textarea class="text-gray-800 box-content w-64 resize-none" rows="7"
                                                  id="content${comment.appraisalNo}"
                                                  disabled>${comment.comment}</textarea>
                                </div>

                                <div class="flex flex-row px-2 py-2">
                                    <div>&#x1F4C6</div>
                                    <div class="ml-2 pr-2 text-gray-600" id="startDate${comment.appraisalNo}">
                                            ${comment.startDate}
                                    </div>
                                    ~
                                    <div class="ml-3 text-gray-600" id="endDate${comment.appraisalNo}">
                                            ${comment.endDate}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
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
<%--        <c:if test="${!empty authInfo}">--%>
<%--            <div class="flex flex-col justify-center items-center text-center text-black p-16 space-x-2 space-y-4">--%>
<%--                <c:if test="${!empty myID}">--%>

<%--                        <div class="flex flex-row">--%>
<%--                            <div class="text-2xl">${myID}</div>--%>
<%--                            <span class="text-xl">님 안녕하세요 :)</span>--%>
<%--                        </div>--%>

<%--                    <div class="flex flex-row space-x-2">--%>
<%--                        <c:if test="${!empty myCommentCount}">--%>
<%--                            <span class="text-xl">지금까지</span>--%>
<%--                            <span class="text-2xl hover:text-purple-600">${myCommentCount}개의 코멘트,</span>--%>
<%--                            <span class="text-2xl hover:text-pink-600">${myStarCount}개의 평가</span>--%>
<%--                            <span class="text-xl">를 등록하였어요!</span>--%>
<%--                        </c:if>--%>
<%--                    </div>--%>
<%--             </div>--%>

<%--                    <div class="flex flex-col mb-20">--%>
<%--                        <span class="text-xl mb-4">${myID}님이 읽고싶은 도서</span>--%>

<%--                        <div class="w-full relative flex items-center justify-center">--%>
<%--                            <button id="prev3" aria-label="slide backward"--%>
<%--                                    class="absolute top-[45%] z-0 -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                                ❮--%>
<%--                            </button>--%>

<%--                            <div id="wantReadList" class="relative w-full overflow-x-hidden overflow-y-hidden">--%>
<%--                                <div id="wantReadBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>--%>
<%--                            </div>--%>

<%--                            <button id="next3" aria-label="slide forward"--%>
<%--                                    class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                                ❯--%>
<%--                            </button>--%>
<%--                        </div>--%>

<%--                        <template id="template__wantReadDetail__link">--%>
<%--                            <a href='{wantReadDetail__link}' class="list-none flex flex-shrink-0">--%>
<%--                                <img class='h-72 w-48' src='{wantReadBook_thumbnail}'/>--%>
<%--                            </a>--%>
<%--                        </template>--%>
<%--                    </div>--%>

<%--                    <div class="flex flex-col mb-20">--%>
<%--                        <span class="text-xl mb-4">${myID}님이 읽는 중인 도서</span>--%>

<%--                        <div class="w-full relative flex items-center justify-center">--%>
<%--                            <button id="prev4" aria-label="slide backward"--%>
<%--                                    class="absolute top-[45%] z-0 -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                                ❮--%>
<%--                            </button>--%>

<%--                            <div id="readingList" class="relative w-full overflow-x-hidden overflow-y-hidden">--%>
<%--                                <div id="readingBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>--%>
<%--                            </div>--%>

<%--                            <button id="next4" aria-label="slide forward"--%>
<%--                                    class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                                ❯--%>
<%--                            </button>--%>
<%--                        </div>--%>

<%--                        <template id="template__readingDetail__link">--%>
<%--                            <a href='{readingDetail__link}' class="list-none flex flex-shrink-0">--%>
<%--                                <img class='h-72 w-48' src='{readingBook_thumbnail}'/>--%>
<%--                            </a>--%>
<%--                        </template>--%>
<%--                    </div>--%>
<%--                </c:if>--%>

<%--        </c:if>--%>

<%--        &lt;%&ndash;        <figure class="snip1368">&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample30.jpg" alt="sample30"/>&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <h3>1위</h3>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        </figure>&ndash;%&gt;--%>


<%--        <div class="flex flex-col mb-20">--%>
<%--            <span class="text-xl mb-4">인기 도서 TOP10</span>--%>

<%--            <div class="w-full relative flex items-center justify-center">--%>
<%--                <button id="prev" aria-label="slide backward"--%>
<%--                        class="absolute top-[45%] z-0 -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                    ❮--%>
<%--                </button>--%>

<%--                <div id="popularList" class="relative w-full overflow-x-hidden overflow-y-hidden">--%>
<%--                    <div id="popularBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>--%>
<%--                </div>--%>

<%--                <button id="next" aria-label="slide forward"--%>
<%--                        class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                    ❯--%>
<%--                </button>--%>
<%--            </div>--%>

<%--            <template id="template__detail__link">--%>
<%--                <a href='{detail__link}' class="list-none flex flex-shrink-0">--%>
<%--                    <img class='h-72 w-48' src='{book_thumbnail}'/>--%>
<%--                </a>--%>
<%--            </template>--%>
<%--        </div>--%>


<%--        <div class="flex flex-col mb-20">--%>
<%--            <span class="text-xl mb-4">이런 책은 어떠세요?</span>--%>

<%--            <div class="w-full relative flex items-center justify-center">--%>
<%--                <button id="prev2" aria-label="slide backward"--%>
<%--                        class="absolute top-[45%] -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                    ❮--%>
<%--                </button>--%>

<%--                <div id="recommendList" class="relative w-full overflow-x-hidden overflow-y-hidden">--%>
<%--                    <div id="recommendBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>--%>
<%--                </div>--%>

<%--                <button id="next2" aria-label="slide forward"--%>
<%--                        class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">--%>
<%--                    ❯--%>
<%--                </button>--%>
<%--            </div>--%>

<%--            <template id="template__recommendDetail__link">--%>
<%--                <a href='{recommendDetail__link}' class="list-none flex flex-shrink-0">--%>
<%--                    <img class='h-72 w-48' src='{recommendBook_thumbnail}'/>--%>
<%--                </a>--%>
<%--            </template>--%>
<%--        </div>--%>

<%--        <div class="flex flex-col mb-20">--%>
<%--            <span class="text-xl mb-4">최근 코멘트</span>--%>
<%--            <div class="overflow-x-auto w-full">--%>
<%--                <c:if test="${!empty latestComments}">--%>
<%--                    <table class="table w-full">--%>
<%--                        <thead>--%>
<%--                        <tr class="text-xl text-center">--%>
<%--                            <th>이름 / ID</th>--%>
<%--                            <th>도서</th>--%>
<%--                            <th>코멘트</th>--%>
<%--                            <th>평가</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <c:forEach var="latestComment" items="${latestComments}">--%>
<%--                            <tr>--%>
<%--                                <td>--%>
<%--                                    <div class="flex justify-center items-center text-center space-x-3">--%>
<%--                                        <div>${latestComment.storedPic}</div>--%>
<%--                                        <div>--%>
<%--                                            <div class="font-bold">${latestComment.id}</div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                                <td class="justify-center items-center text-center">--%>
<%--                                    <span id="bookName${latestComment.isbn}" class="w-40"></span>--%>
<%--                                </td>--%>
<%--                                <td class="justify-center items-center text-center">--%>
<%--                                    <c:if test="${latestComment.comment.length() > 20}">--%>
<%--                                        <textarea rows="2" disabled>${latestComment.comment}</textarea>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${latestComment.comment.length() <= 20}">--%>
<%--                                        ${latestComment.comment}--%>
<%--                                    </c:if>--%>
<%--                                </td>--%>
<%--                                <td class="justify-center items-center text-center text-yellow-400">--%>
<%--                                    <c:if test="${latestComment.star==0}">☆☆☆☆☆</c:if>--%>
<%--                                    <c:if test="${latestComment.star==1}">★☆☆☆☆</c:if>--%>
<%--                                    <c:if test="${latestComment.star==2}">★★☆☆☆</c:if>--%>
<%--                                    <c:if test="${latestComment.star==3}">★★★☆☆</c:if>--%>
<%--                                    <c:if test="${latestComment.star==4}">★★★★☆</c:if>--%>
<%--                                    <c:if test="${latestComment.star==5}">★★★★★</c:if>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </c:if>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

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
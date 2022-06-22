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
                        <svg id="Layer_1"  height="30" width="30" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M24,11c-7.2,0-13,5.8-13,13c0,7.2,5.8,13,13,13c7.2,0,13-5.8,13-13C37,16.8,31.2,11,24,11z M24,35c-6.1,0-11-4.9-11-11   s4.9-11,11-11s11,4.9,11,11S30.1,35,24,35z"/><path d="M44,20h-2.4c-0.5-2.1-1.3-4-2.3-5.6l1.6-1.8c1.2-1.2,1.2-3,0-4.2L39.5,7c-1.2-1.2-3.1-1.2-4.2,0l-1.8,1.8   c-1.8-1.2-3.6-1.9-5.6-2.3V4c0-1.7-1.3-3-3-3h-2c-1.7,0-3,1.3-3,3v2.5c-1.9,0.4-3.8,1.2-5.6,2.3l-1.7-1.7c-1.2-1.2-3-1.2-4.2,0   L7,8.5c-0.6,0.6-0.9,1.3-0.9,2.1s0.3,1.5,0.9,2.1l1.8,1.7c-1.1,1.8-1.9,3.6-2.3,5.6H4c-1.7,0-3,1.3-3,3v2c0,1.7,1.3,3,3,3h2.5   c0.4,1.9,1.2,3.8,2.4,5.6l-1.7,1.8c-1.2,1.2-1.2,3,0,4.2L8.5,41c1.2,1.2,3,1.2,4.2,0l1.7-1.8c1.8,1.1,3.6,1.9,5.6,2.3V44   c0,1.7,1.3,3,3,3h2c1.7,0,3-1.3,3-3v-2.4c2.1-0.5,3.9-1.3,5.6-2.3l1.7,1.6c1.2,1.2,3,1.2,4.2,0l1.4-1.4c1.2-1.2,1.2-3,0-4.2   l-1.7-1.7c1.2-1.8,1.9-3.6,2.3-5.6H44c1.7,0,3-1.3,3-3v-2C47,21.3,45.7,20,44,20z M45,25c0,0.6-0.4,1-1,1h-4.2l-0.1,0.8   c-0.4,2.2-1.2,4.3-2.6,6.3l-0.5,0.7l2.9,2.9c0.2,0.2,0.3,0.4,0.3,0.7c0,0.3-0.1,0.5-0.3,0.7l-1.4,1.4c-0.4,0.4-1,0.4-1.4,0   l-2.9-2.8l-0.7,0.5c-1.8,1.3-3.9,2.2-6.3,2.6L26,40v4c0,0.6-0.4,1-1,1h-2c-0.6,0-1-0.4-1-1v-4.2l-0.8-0.1c-2.2-0.4-4.3-1.2-6.3-2.6   l-0.7-0.5l-2.9,3c-0.4,0.4-1,0.4-1.4,0l-1.4-1.4c-0.4-0.4-0.4-1,0-1.4l2.9-3l-0.5-0.7c-1.4-2-2.3-4.1-2.6-6.3L8.2,26H4   c-0.6,0-1-0.4-1-1v-2c0-0.6,0.4-1,1-1h4.2l0.1-0.8c0.4-2.2,1.2-4.3,2.6-6.3l0.5-0.7l-3-2.9c-0.2-0.2-0.3-0.4-0.3-0.7   s0.1-0.5,0.3-0.7l1.4-1.4c0.4-0.4,1-0.4,1.4,0l2.9,2.9l0.7-0.5c1.9-1.4,4.1-2.3,6.3-2.6l0.8-0.1V4c0-0.6,0.4-1,1-1h2   c0.6,0,1,0.4,1,1v4.2l0.8,0.1c2.2,0.4,4.3,1.2,6.3,2.6l0.7,0.5l3-3c0.4-0.4,1-0.4,1.4,0l1.4,1.4c0.4,0.4,0.4,1,0,1.4l-2.7,3   l0.5,0.7c1.2,1.8,2.1,3.9,2.6,6.3L40,22h4c0.6,0,1,0.4,1,1V25z"/></g></svg>
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

<%--            <div class="carousel carousel-center pl-4 pb-4 space-x-2 w-pull bg-gray-100">--%>
<%--                <c:if test="${!empty commentsByMembers}">--%>
<%--                    <c:forEach var="comment" items="${commentsByMembers}">--%>
<%--                        <div class="carousel-item rounded-lg bg-white w-80 h-72 flex flex-col">--%>
<%--                            <div class="p-4 space-x-4">--%>
<%--                                <div class="flex flex-row border-b-2 border-gray-300 mt-2">--%>
<%--                                    <div class="ml-4 mr-2 text-gray-600">${comment.originPic}</div>--%>

<%--                                    <c:set var="idSub" value="${fn:substring(comment.id,0,5)}" />--%>
<%--                                    <c:if test="${idSub ne 'kakao'}">--%>
<%--                                        <div class="text-gray-600 text-sm">${comment.id}</div>--%>
<%--                                    </c:if>--%>

<%--                                    <c:if test="${idSub eq 'kakao'}">--%>
<%--                                        <div class="text-gray-600 text-sm">${comment.name}</div>--%>
<%--                                    </c:if>--%>

<%--                                    <div id="star${comment.id}"></div>--%>
<%--                                </div>--%>

<%--                                <div class="border-b-2 border-gray-300 py-2">--%>
<%--                                        <textarea class="text-gray-800 box-content w-64 resize-none" rows="7"--%>
<%--                                                  id="content${comment.appraisalNo}"--%>
<%--                                                  disabled>${comment.comment}</textarea>--%>
<%--                                </div>--%>

<%--                                <div class="flex flex-row px-2 py-2">--%>
<%--                                    <div>&#x1F4C6</div>--%>
<%--                                    <div class="ml-2 pr-2 text-gray-600" id="startDate${comment.appraisalNo}">--%>
<%--                                            ${comment.startDate}--%>
<%--                                    </div>--%>
<%--                                    ~--%>
<%--                                    <div class="ml-3 text-gray-600" id="endDate${comment.appraisalNo}">--%>
<%--                                            ${comment.endDate}--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </c:if>--%>
<%--            </div>--%>

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
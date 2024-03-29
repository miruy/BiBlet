<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">

        <c:if test="${!empty authInfo}">

            <div class="flex flex-col justify-center items-center text-center text-black p-16 space-x-2 space-y-4">

                <div class="flex flex-row">
                    <c:if test="${!empty myID}"><div class="text-2xl">${myID}</div></c:if>
                    <span class="text-xl">님 안녕하세요 :)</span>
                </div>

                <div class="flex flex-row space-x-2">
                    <c:if test="${!empty myCommentCount}">
                        <span class="text-xl">지금까지</span>
                        <a href="/myComment" class="text-2xl hover:text-purple-600">${myCommentCount}개의 코멘트,</a>
                    </c:if>
                    <c:if test="${!empty myStarCount}">
                        <a href="/myEvaluate" class="text-2xl hover:text-pink-600">${myStarCount}개의 평가</a>
                        <span class="text-xl">를 등록하였어요!</span>
                    </c:if>
                </div>

            </div>

            <c:if test="${!empty wantReadList}">
                <div class="flex flex-col mb-20">
                    <c:if test="${!empty myID}"><span class="text-xl mb-4">${myID}님이 읽고싶은 도서</span></c:if>

                    <div class="w-full relative flex items-center justify-center shadow-2xl">
                        <button id="prev3" aria-label="slide backward"
                                class="absolute -left-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                            ❮
                        </button>

                        <div id="wantReadList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                            <div id="wantReadBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                        </div>

                        <button id="next3" aria-label="slide forward"
                                class="absolute -right-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                            ❯
                        </button>
                    </div>

                    <template id="template__wantReadDetail__link">
                        <a href='{wantReadDetail__link}' class="list-none flex flex-shrink-0">
                            <img class='h-72 w-48 rounded-lg shadow-2xl' src='{wantReadBook_thumbnail}'/>
                        </a>
                    </template>
                </div>
            </c:if>

            <c:if test="${!empty readingList}">
                <div class="flex flex-col mb-20">
                    <c:if test="${!empty myID}"><span class="text-xl mb-4">${myID}님이 읽는 중인 도서</span></c:if>

                    <div class="w-full relative flex items-center justify-center shadow-2xl">
                        <button id="prev4" aria-label="slide backward"
                                class="absolute -left-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                            ❮
                        </button>

                        <div id="readingList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                            <div id="readingBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                        </div>

                        <button id="next4" aria-label="slide forward"
                                class="absolute -right-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                            ❯
                        </button>
                    </div>

                    <template id="template__readingDetail__link">
                        <a href='{readingDetail__link}' class="list-none flex flex-shrink-0">
                            <img class='h-72 w-48 rounded-lg shadow-2xl' src='{readingBook_thumbnail}'/>
                        </a>
                    </template>
                </div>
            </c:if>

        </c:if>

<%--        <div class="carousel w-full">--%>
<%--            <div id="slide1" class="carousel-item relative w-full">--%>
<%--                <img src="https://placeimg.com/800/200/arch" class="w-full" />--%>
<%--                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">--%>
<%--                    <a href="#slide4" class="btn btn-circle">❮</a>--%>
<%--                    <a href="#slide2" class="btn btn-circle">❯</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div id="slide2" class="carousel-item relative w-full">--%>
<%--                <img src="https://placeimg.com/800/200/arch" class="w-full" />--%>
<%--                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">--%>
<%--                    <a href="#slide1" class="btn btn-circle">❮</a>--%>
<%--                    <a href="#slide3" class="btn btn-circle">❯</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div id="slide3" class="carousel-item relative w-full">--%>
<%--                <img src="https://placeimg.com/800/200/arch" class="w-full" />--%>
<%--                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">--%>
<%--                    <a href="#slide2" class="btn btn-circle">❮</a>--%>
<%--                    <a href="#slide4" class="btn btn-circle">❯</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div id="slide4" class="carousel-item relative w-full">--%>
<%--                <img src="https://placeimg.com/800/200/arch" class="w-full" />--%>
<%--                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">--%>
<%--                    <a href="#slide3" class="btn btn-circle">❮</a>--%>
<%--                    <a href="#slide1" class="btn btn-circle">❯</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>



<%--        <div class="flex flex-col mb-20">--%>
<%--            <span class="text-xl mb-4">인기 도서 TOP10</span>--%>
<%--            <div class="carousel w-full shadow-2xl">--%>
<%--                <div id="slide1" class="carousel-item relative w-full">--%>
<%--                    <div class="absolute -left-11 z-30">--%>
<%--                        <a href="#slide2" class="btn btn-ghost w-10 h-72 text-4xl text-gray-600  hover:text-white">❮</a>--%>
<%--                    </div>--%>
<%--                    <div class="absolute -right-11 z-30">--%>
<%--                        <a href="#slide2" class="btn btn-ghost w-10 h-72 text-4xl text-gray-600  hover:text-white">❯</a>--%>
<%--                    </div>--%>
<%--                    --%>
<%--                    <div id="popularSlide1to5" class="flex"></div>--%>
<%--                </div>--%>

<%--                <div id="slide2" class="carousel-item relative w-full">--%>
<%--                    <div class="absolute -left-5">--%>
<%--                        <a href="#slide1" class="btn btn-ghost w-10 h-72 text-4xl text-gray-600  hover:text-white">❮</a>--%>
<%--                    </div>--%>

<%--                    <div id="popularSlide6to10" class="flex"></div>--%>

<%--                    <div class="absolute -right-5">--%>
<%--                        <a href="#slide1" class="btn btn-ghost w-10 h-72 text-4xl text-gray-600  hover:text-white">❯</a>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>


        <div class="flex flex-col mb-20">
            <span class="text-xl mb-4">인기 도서 TOP10</span>

            <div class="w-full relative flex items-center justify-center shadow-2xl">
                <button id="prev" aria-label="slide backward"
                        class="absolute -left-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                    ❮
                </button>

                <div id="popularList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                    <div id="popularBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                </div>

                <button id="next" aria-label="slide forward"
                        class="absolute -right-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                    ❯
                </button>
            </div>

            <template id="template__detail__link">
                <a href='{detail__link}' id="detail__link" class="list-none flex flex-shrink-0">
                    <figure class="snip1368 shadow-2xl">
                        <img class='h-72 w-48' id="book_thumbnail" src='{book_thumbnail}'/>
                        <div class="text-5xl" id='popularRank'>{popularRank}</div>
                    </figure>
                </a>
            </template>

        </div>


        <div class="flex flex-col mb-20">
            <span class="text-xl mb-4">읽고싶은 도서 TOP10</span>

            <div class="w-full relative flex items-center justify-center shadow-2xl">
                <button id="prev2" aria-label="slide backward"
                        class="absolute -left-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                    ❮
                </button>

                <div id="recommendList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                    <div id="recommendBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                </div>

                <button id="next2" aria-label="slide forward"
                        class="absolute -right-11 z-30 btn btn-ghost w-10 h-72 text-4xl text-gray-600 hover:text-white">
                    ❯
                </button>
            </div>

            <template id="template__recommendDetail__link">
                <a href='{recommendDetail__link}' class="list-none flex flex-shrink-0">
                    <figure class="snip1368 shadow-2xl">
                        <img class='h-72 w-48 rounded-lg shadow-2xl' src='{recommendBook_thumbnail}'/>
                        <div class="text-5xl" id='recommendRank'>{recommendRank}</div>
                    </figure>
                </a>
            </template>
        </div>

        <c:if test="${!empty latestComments}">

            <div class="flex flex-col mb-20">

                <span class="text-xl mb-4">최근 코멘트</span>
                <div class="overflow-x-auto w-full shadow-2xl rounded-2xl">

                    <table class="table w-full">
                        <thead>
                            <tr class="text-xl text-center">
                                <th>이름 / ID</th>
                                <th>도서</th>
                                <th>코멘트</th>
                                <th>평가</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="latestComment" items="${latestComments}">

                                <tr>
                                    <td>
                                        <div class="flex">
                                            <div class="text-center mt-1.5 ml-4">

                                                <c:if test="${latestComment.storedPic eq null}">
                                                    <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                                        <svg class="absolute w-12 h-12 text-gray-400 pr-2"
                                                             fill="currentColor" viewBox="0 0 20 20"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd"
                                                                  d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                                                  clip-rule="evenodd"></path>
                                                        </svg>
                                                    </div>
                                                </c:if>

                                                <c:if test="${latestComment.storedPic ne null}">
                                                    <c:set var="idSub" value="${fn:substring(latestComment.id,0,5)}"/>
                                                    <c:if test="${idSub ne 'kakao'}">
                                                        <img src="<c:url value='/images/${latestComment.storedPic}'/>"
                                                             class="mask mask-circle w-10 h-10"/>
                                                    </c:if>
                                                    <c:if test="${idSub eq 'kakao'}">
                                                        <img src="<c:url value='http://${latestComment.storedPic}'/>"
                                                             class="mask mask-circle w-10 h-10"/>
                                                    </c:if>
                                                </c:if>

                                            </div>

                                            <div class="p-4">
                                                <c:set var="idSub" value="${fn:substring(latestComment.id,0,5)}"/>
                                                <c:if test="${idSub ne 'kakao'}">
                                                    <div class="font-bold">${latestComment.id}</div>
                                                </c:if>
                                                <c:if test="${idSub eq 'kakao'}">
                                                    <div class="font-bold">${latestComment.name}</div>
                                                </c:if>
                                            </div>
                                        </div>

                                    </td>

                                    <td class="justify-center items-center text-center">
                                        <span id="bookName${latestComment.appraisalNo}" class="w-40"></span>
                                    </td>

                                    <td class="justify-center items-center text-center">
                                        <c:if test="${latestComment.active == 0}">
                                            <span>해당 코멘트는 권리자 권한으로 표시가 중지되었습니다.</span>
                                        </c:if>
                                        <c:if test="${latestComment.active == 1}">
                                            <c:if test="${latestComment.comment.length() > 40}">
                                                <textarea class="resize-none w-64" rows="2" disabled>${latestComment.comment}</textarea>
                                            </c:if>
                                            <c:if test="${latestComment.comment.length() <= 40}">
                                                ${latestComment.comment}
                                            </c:if>
                                        </c:if>
                                    </td>

                                    <td class="justify-center items-center text-center text-yellow-400">
                                        <c:if test="${latestComment.star==0}">☆☆☆☆☆</c:if>
                                        <c:if test="${latestComment.star==1}">★☆☆☆☆</c:if>
                                        <c:if test="${latestComment.star==2}">★★☆☆☆</c:if>
                                        <c:if test="${latestComment.star==3}">★★★☆☆</c:if>
                                        <c:if test="${latestComment.star==4}">★★★★☆</c:if>
                                        <c:if test="${latestComment.star==5}">★★★★★</c:if>
                                    </td>

                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>

        </c:if>

    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        // TOP10 순위 표시
        $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            }
        );

        // 인기도서 top10
        let defaultTransform = 0;

        function goNext() {
            defaultTransform = defaultTransform - 395;
            var slider = document.getElementById("popularBook__detail");
            if (Math.abs(defaultTransform) >= slider.scrollWidth / 2.1) defaultTransform = 0;
            slider.style.transform = "translateX(" + defaultTransform + "px)";
        }

        next.addEventListener("click", goNext);

        function goPrev() {
            var slider = document.getElementById("popularBook__detail");
            if (Math.abs(defaultTransform) === 0) defaultTransform = 0;
            else defaultTransform = defaultTransform + 395;
            slider.style.transform = "translateX(" + defaultTransform + "px)";
        }

        prev.addEventListener("click", goPrev);


        function popularList() {

            const isbns = ${popularList};
            console.log(isbns);

            isbns.map((isbn, index) => {
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
                    const ranks = index + 1;
                    console.log("ranks : " + ranks);

                    const result = $("#template__detail__link").html()
                        .replace("{detail__link}", "/read/" + isbn)
                        .replace("{book_thumbnail}", thumbnailLink)
                        .replace("{popularRank}", ranks);

                    $("#popularBook__detail").append(result);
                });
            })
        }

        popularList();



        <%--function TESTpopularList() {--%>

        <%--    const isbns = ${popularList};--%>

        <%--    isbns.map((isbn, index) => {;--%>
        <%--        $.ajax({	//카카오 검색요청 / [요청]--%>
        <%--            method: "GET",--%>
        <%--            traditional: true,--%>
        <%--            async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)--%>
        <%--            url: "https://dapi.kakao.com/v3/search/book?target=isbn",--%>
        <%--            data: {query: isbn},--%>
        <%--            headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}--%>
        <%--        })--%>
        <%--        .done(function (data) {	//검색 결과 담기 / [응답]--%>
        <%--            const book = data.documents[0];--%>
        <%--            const isbn = book.isbn.slice(-13);--%>
        <%--            const thumbnailLink = book.thumbnail;--%>

        <%--            if(index < 5){--%>
        <%--                $("#popularSlide1to5").append("<a href='/read/" + isbn + "'>" + "<img class='h-72 w-48 rounded-lg shadow-2xl mx-2' src='" + thumbnailLink + "'/></a>");--%>
        <%--            } else {--%>
        <%--                $("#popularSlide6to10").append("<a href='/read/" + isbn + "'>" + "<img class='h-72 w-48 rounded-lg shadow-2xl mx-2' src='" + thumbnailLink + "'/></a>");--%>
        <%--            }--%>
        <%--        });--%>
        <%--    })--%>
        <%--}--%>

        <%--TESTpopularList();--%>



        // 추천도서 10(이런 책은 어떠세요?)
        let defaultTransform2 = 0;

        function goNext2() {
            defaultTransform2 = defaultTransform2 - 395;
            var slider = document.getElementById("recommendBook__detail");
            if (Math.abs(defaultTransform2) >= slider.scrollWidth / 2.1) defaultTransform2 = 0;
            slider.style.transform = "translateX(" + defaultTransform2 + "px)";
        }

        next2.addEventListener("click", goNext2);

        function goPrev2() {
            var slider = document.getElementById("recommendBook__detail");
            if (Math.abs(defaultTransform2) === 0) defaultTransform2 = 0;
            else defaultTransform2 = defaultTransform2 + 395;
            slider.style.transform = "translateX(" + defaultTransform2 + "px)";
        }

        prev2.addEventListener("click", goPrev2);


        function recommendList() {

            const isbns = ${recommendList};
            console.log(isbns);

            isbns.map((isbn,index) => {
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
                        const ranks = index + 1;

                        console.log("thumbnailLink : " + thumbnailLink);

                        const result = $("#template__recommendDetail__link").html()
                            .replace("{recommendDetail__link}", "/read/" + isbn)
                            .replace("{recommendBook_thumbnail}", thumbnailLink)
                            .replace("{recommendRank}", ranks);

                        $("#recommendBook__detail").append(result);
                    });
            })
        }

        recommendList();


        $(document).ready(function () {

            // 최근 코멘트
            <c:if test="${!empty latestComments}">
            <c:forEach var="latestComment" items="${latestComments}">
            latestComments(${latestComment.isbn}, ${latestComment.appraisalNo})
            </c:forEach>
            </c:if>

            <c:if test="${! empty authInfo}">
            // 로그인 시 (회원)님이 읽고싶은 도서
            let defaultTransform3 = 0;

            function goNext3() {
                defaultTransform3 = defaultTransform3 - 395;
                var slider = document.getElementById("wantReadBook__detail");
                if (Math.abs(defaultTransform3) >= slider.scrollWidth / 2.1) defaultTransform3 = 0;
                slider.style.transform = "translateX(" + defaultTransform3 + "px)";
            }

            next3.addEventListener("click", goNext3);

            function goPrev3() {
                var slider = document.getElementById("wantReadBook__detail");
                if (Math.abs(defaultTransform3) === 0) defaultTransform3 = 0;
                else defaultTransform3 = defaultTransform3 + 395;
                slider.style.transform = "translateX(" + defaultTransform3 + "px)";
            }

            prev3.addEventListener("click", goPrev3);


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


            // 로그인 시 (회원)님이 읽는 중인 도서
            let defaultTransform4 = 0;

            function goNext4() {
                defaultTransform4 = defaultTransform4 - 395;
                var slider = document.getElementById("readingBook__detail");
                if (Math.abs(defaultTransform4) >= slider.scrollWidth / 2.1) defaultTransform4 = 0;
                slider.style.transform = "translateX(" + defaultTransform4 + "px)";
            }

            next4.addEventListener("click", goNext4);

            function goPrev4() {
                var slider = document.getElementById("readingBook__detail");
                if (Math.abs(defaultTransform4) === 0) defaultTransform4 = 0;
                else defaultTransform4 = defaultTransform4 + 395;
                slider.style.transform = "translateX(" + defaultTransform4 + "px)";
            }

            prev4.addEventListener("click", goPrev4);


            function readingList() {
                const isbns = ${readingList};
                console.log("읽는 중 인 도서 : " + isbns);

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
            </c:if>

        });


        // 최근 코멘트 5개
        function latestComments(isbn, appraisalNo) {
            console.log(isbn);
            console.log("appraisalNo : " + appraisalNo);
            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                traditional: true,
                async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                data: {query: isbn},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })
                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log("title : " + msg.documents[0].title);

                    let title = msg.documents[0].title;

                    if (title.length >= 20) {
                        $("#bookName" + appraisalNo).append("<a href='/read/" + isbn + "'>" + title.slice(0, 20) + "...</a>");
                    } else if (title.length <= 20) {
                        $("#bookName" + appraisalNo).append("<a href='/read/" + isbn + "'>" + title + "</a>");
                    }
                });
        }


    </script>

</section>

<%@ include file="common/footer.jsp" %>
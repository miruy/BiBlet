<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">

        <c:if test="${!empty authInfo}">
            <div class="flex flex-col justify-center items-center text-center text-black p-16 space-x-2 space-y-4">
            <c:if test="${!empty myID}">

                <div class="flex flex-row">
                    <div class="text-2xl">${myID}</div>
                    <span class="text-xl">님 안녕하세요 :)</span>
                </div>

                <div class="flex flex-row space-x-2">
                    <c:if test="${!empty myCommentCount}">
                        <span class="text-xl">지금까지</span>
                        <span class="text-2xl hover:text-purple-600">${myCommentCount}개의 코멘트,</span>
                        <span class="text-2xl hover:text-pink-600">${myStarCount}개의 평가</span>
                        <span class="text-xl">를 등록하였어요!</span>
                    </c:if>
                </div>
                </div>

                <div class="flex flex-col mb-20">
                    <span class="text-xl mb-4">${myID}님이 읽고싶은 도서</span>

                    <div class="w-full relative flex items-center justify-center">
                        <button id="prev3" aria-label="slide backward"
                                class="absolute top-[45%] z-0 -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                            ❮
                        </button>

                        <div id="wantReadList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                            <div id="wantReadBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                        </div>

                        <button id="next3" aria-label="slide forward"
                                class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                            ❯
                        </button>
                    </div>

                    <template id="template__wantReadDetail__link">
                        <a href='{wantReadDetail__link}' class="list-none flex flex-shrink-0">
                            <img class='h-72 w-48 rounded-lg' src='{wantReadBook_thumbnail}'/>
                        </a>
                    </template>
                </div>

                <div class="flex flex-col mb-20">
                    <span class="text-xl mb-4">${myID}님이 읽는 중인 도서</span>

                    <div class="w-full relative flex items-center justify-center">
                        <button id="prev4" aria-label="slide backward"
                                class="absolute top-[45%] z-0 -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                            ❮
                        </button>

                        <div id="readingList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                            <div id="readingBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                        </div>

                        <button id="next4" aria-label="slide forward"
                                class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                            ❯
                        </button>
                    </div>

                    <template id="template__readingDetail__link">
                        <a href='{readingDetail__link}' class="list-none flex flex-shrink-0">
                            <img class='h-72 w-48 rounded-lg' src='{readingBook_thumbnail}'/>
                        </a>
                    </template>
                </div>
            </c:if>

        </c:if>

        <%--        <figure class="snip1368">--%>
        <%--            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample30.jpg" alt="sample30"/>--%>
        <%--            <h3>1위</h3>--%>
        <%--        </figure>--%>


        <div class="flex flex-col mb-20">
            <span class="text-xl mb-4">인기 도서 TOP10</span>

            <div class="w-full relative flex items-center justify-center">
                <button id="prev" aria-label="slide backward"
                        class="absolute top-[45%] z-0 -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                    ❮
                </button>

                <div id="popularList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                    <div id="popularBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                </div>

                <button id="next" aria-label="slide forward"
                        class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                    ❯
                </button>
            </div>

            <template id="template__detail__link">
                <a href='{detail__link}' class="list-none flex flex-shrink-0">
                    <img class='h-72 w-48 rounded-lg' src='{book_thumbnail}'/>
                </a>
            </template>
        </div>


        <div class="flex flex-col mb-20">
            <span class="text-xl mb-4">이런 책은 어떠세요?</span>

            <div class="w-full relative flex items-center justify-center">
                <button id="prev2" aria-label="slide backward"
                        class="absolute top-[45%] -left-4 z-30 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                    ❮
                </button>

                <div id="recommendList" class="relative w-full overflow-x-hidden overflow-y-hidden">
                    <div id="recommendBook__detail" class="flex w-full space-x-4 sm:w-auto"></div>
                </div>

                <button id="next2" aria-label="slide forward"
                        class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">
                    ❯
                </button>
            </div>

            <template id="template__recommendDetail__link">
                <a href='{recommendDetail__link}' class="list-none flex flex-shrink-0">
                    <img class='h-72 w-48 rounded-lg' src='{recommendBook_thumbnail}'/>
                </a>
            </template>
        </div>

        <div class="flex flex-col mb-20">
            <span class="text-xl mb-4">최근 코멘트</span>
            <div class="overflow-x-auto w-full">
                <c:if test="${!empty latestComments}">
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
                                    <div class="flex justify-center items-center text-center space-x-3">
                                        <c:if test="${latestComment.storedPic eq null}">
                                            <div>${latestComment.originPic}</div>
                                        </c:if>
                                        <c:if test="${latestComment.storedPic ne null}">
                                            <div>http://${latestComment.storedPic}</div>
                                        </c:if>
                                        <div>
                                            <div class="font-bold">${latestComment.id}</div>
                                        </div>
                                    </div>
                                </td>
                                <td class="justify-center items-center text-center">
                                    <span id="bookName${latestComment.isbn}" class="w-40"></span>
                                </td>
                                <td class="justify-center items-center text-center">
                                    <c:if test="${latestComment.comment.length() > 20}">
                                        <textarea rows="2" disabled>${latestComment.comment}</textarea>
                                    </c:if>
                                    <c:if test="${latestComment.comment.length() <= 20}">
                                        ${latestComment.comment}
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
                </c:if>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        /* Demo purposes only */
        $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            }
        );


        // 인기도서 top10
        let defaultTransform = 0;

        function goNext() {
            defaultTransform = defaultTransform - 398;
            var slider = document.getElementById("popularBook__detail");
            if (Math.abs(defaultTransform) >= slider.scrollWidth / 1.7) defaultTransform = 0;
            slider.style.transform = "translateX(" + defaultTransform + "px)";
        }

        next.addEventListener("click", goNext);

        function goPrev() {
            var slider = document.getElementById("popularBook__detail");
            if (Math.abs(defaultTransform) === 0) defaultTransform = 0;
            else defaultTransform = defaultTransform + 398;
            slider.style.transform = "translateX(" + defaultTransform + "px)";
        }

        prev.addEventListener("click", goPrev);


        function popularList() {

            const isbns = ${popularList};
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

                        console.log("isnb : " + isbn);

                        const result = $("#template__detail__link").html()
                            .replace("{detail__link}", "/read/" + isbn)
                            .replace("{book_thumbnail}", thumbnailLink);

                        $("#popularBook__detail").append(result);
                    });
            })
        }

        popularList();


        // 추천도서 10(이런 책은 어떠세요?)
        let defaultTransform2 = 0;

        function goNext2() {
            defaultTransform2 = defaultTransform2 - 398;
            var slider = document.getElementById("recommendBook__detail");
            if (Math.abs(defaultTransform2) >= slider.scrollWidth / 1.7) defaultTransform2 = 0;
            slider.style.transform = "translateX(" + defaultTransform2 + "px)";
        }

        next2.addEventListener("click", goNext2);

        function goPrev2() {
            var slider = document.getElementById("recommendBook__detail");
            if (Math.abs(defaultTransform2) === 0) defaultTransform2 = 0;
            else defaultTransform2 = defaultTransform2 + 398;
            slider.style.transform = "translateX(" + defaultTransform2 + "px)";
        }

        prev2.addEventListener("click", goPrev2);


        function recommendList() {

            const isbns = ${recommendList};
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

                        const result = $("#template__recommendDetail__link").html()
                            .replace("{recommendDetail__link}", "/read/" + isbn)
                            .replace("{recommendBook_thumbnail}", thumbnailLink);

                        $("#recommendBook__detail").append(result);
                    });
            })
        }

        recommendList();


        $(document).ready(function () {

            // 최근 코멘트
            <c:if test="${!empty latestComments}">
            <c:forEach var="latestComment" items="${latestComments}">
            latestComments(${latestComment.isbn})
            </c:forEach>
            </c:if>

            <c:if test="${! empty authInfo}">
            // 로그인 시 (회원)님이 읽고싶은 도서
            let defaultTransform3 = 0;

            function goNext3() {
                defaultTransform3 = defaultTransform3 - 398;
                var slider = document.getElementById("wantReadBook__detail");
                if (Math.abs(defaultTransform3) >= slider.scrollWidth / 1.7) defaultTransform3 = 0;
                slider.style.transform = "translateX(" + defaultTransform3 + "px)";
            }

            next3.addEventListener("click", goNext3);

            function goPrev3() {
                var slider = document.getElementById("wantReadBook__detail");
                if (Math.abs(defaultTransform3) === 0) defaultTransform3 = 0;
                else defaultTransform3 = defaultTransform3 + 398;
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
                defaultTransform4 = defaultTransform4 - 398;
                var slider = document.getElementById("readingBook__detail");
                if (Math.abs(defaultTransform4) >= slider.scrollWidth / 1.7) defaultTransform4 = 0;
                slider.style.transform = "translateX(" + defaultTransform4 + "px)";
            }

            next4.addEventListener("click", goNext4);

            function goPrev4() {
                var slider = document.getElementById("readingBook__detail");
                if (Math.abs(defaultTransform4) === 0) defaultTransform4 = 0;
                else defaultTransform4 = defaultTransform4 + 398;
                slider.style.transform = "translateX(" + defaultTransform4 + "px)";
            }

            prev4.addEventListener("click", goPrev4);


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
            </c:if>

        });


        // 최근 코멘트 5개
        function latestComments(isbn, originPic, storedPic, id, comment, star) {
            console.log(isbn);
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
                    $("#bookName" + isbn).append("<a href='/read/" + isbn + "'>" + msg.documents[0].title + "</a>");	//표지
                });
        }


    </script>

</section>

<%@ include file="common/footer.jsp" %>
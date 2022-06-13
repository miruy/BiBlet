<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">
    <c:if test="${!empty myID}">
        <p>
            <span>${myID}님 안녕하세요</span>
            <br>
            <c:if test="${!empty myCommentCount}">
                <span>지금까지 ${myCommentCount}개의 평가를 작성하였어요!</span>
            </c:if>
        </p>
        <span>${myID}이 찜한 도서</span>
    </c:if>
    <div id="myLike"></div>


    <div class="flex flex-col justify-center bg-white px-32 py-8">

        <figure class="snip1368">
            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample30.jpg" alt="sample30"/>
            <h3>1위</h3>
        </figure>


        <div class="flex flex-col">
            <span class="text-xl mb-4">인기 도서 TOP10</span>


            <div class="flex items-center justify-center w-full h-full py-24 sm:py-8 px-4">
                <div class="w-full relative flex items-center justify-center">
                    <button aria-label="slide backward" class="absolute z-30 left-0 ml-10 focus:outline-none focus:bg-gray-400 focus:ring-2 focus:ring-offset-2 focus:ring-gray-400 cursor-pointer" id="prev">
                        <svg class="dark:text-gray-900" width="8" height="14" viewBox="0 0 8 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7 1L1 7L7 13" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </button>
                    <div class="w-full h-full mx-auto overflow-x-hidden overflow-y-hidden">
                        <div id="slider" class="h-full flex lg:gap-8 md:gap-6 gap-14 items-center justify-start transition ease-out duration-700">
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/fDngH9G/carosel-1.png" alt="black chair and white table" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 1</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/DWrGxX6/carosel-2.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/tCfVky2/carosel-3.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/rFsGfr5/carosel-4.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/fDngH9G/carosel-1.png" alt="black chair and white table" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/DWrGxX6/carosel-2.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/tCfVky2/carosel-3.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/rFsGfr5/carosel-4.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/fDngH9G/carosel-1.png" alt="black chair and white table" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/DWrGxX6/carosel-2.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/tCfVky2/carosel-3.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-shrink-0 relative w-full sm:w-auto">
                                <img src="https://i.ibb.co/rFsGfr5/carosel-4.png" alt="sitting area" class="object-cover object-center w-full" />
                                <div class="bg-gray-800 bg-opacity-30 absolute w-full h-full p-6">
                                    <h2 class="lg:text-xl leading-4 text-base lg:leading-5 text-white dark:text-gray-900">Catalog 2</h2>
                                    <div class="flex h-full items-end pb-6">
                                        <h3 class="text-xl lg:text-2xl font-semibold leading-5 lg:leading-6 text-white dark:text-gray-900">Minimal Interior</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button aria-label="slide forward" class="absolute z-30 right-0 mr-10 focus:outline-none focus:bg-gray-400 focus:ring-2 focus:ring-offset-2 focus:ring-gray-400" id="next">
                        <svg class="dark:text-gray-900" width="8" height="14" viewBox="0 0 8 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M1 1L7 7L1 13" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </button>
                </div>
            </div>








            <div id="popularList" class="relative w-full">
                <div id="popularBook__detail" class="flex w-full space-x-4 overflow-hidden"></div>
                <button class="absolute top-[45%] -left-4 z-0 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">❮</button>
                <button class="absolute top-[45%] -right-4 btn btn-circle bg-gray-200 shadow-2xl border-gray-200 sm:btn-sm hover:bg-purple-600 hover:border-purple-600 text-gray-600 hover:text-base-100">❯</button>
            </div>

            <template id="template__detail__link">
                <a href='{detail__link}' class="list-none flex flex-shrink-0">
                    <img class='h-72 w-48' src='{book_thumbnail}'/>
                </a>
            </template>
        </div>


        <span class="text-xl mb-4">최근 코멘트</span>


        <div class="overflow-x-auto w-full">
            <table class="table w-full">
                <!-- head -->
                <thead>
                <tr class="text-xl text-center">
                    <th>이름 / ID</th>
                    <th>도서</th>
                    <th>코멘트</th>
                    <th>평가</th>
                </tr>
                </thead>
                <tbody>
                <!-- row 1 -->
                <tr>
                    <td>
                        <div class="flex items-center space-x-3">
                            <div class="avatar">
                                <div class="mask mask-squircle w-12 h-12">
                                    <img src="/tailwind-css-component-profile-2@56w.png"
                                         alt="Avatar Tailwind CSS Component"/>
                                </div>
                            </div>
                            <div>
                                <div class="font-bold">Hart Hagerty</div>
                                <div class="text-sm opacity-50">United States</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        Zemlak, Daniel and Leannon
                        <br>
                        <span class="badge badge-ghost badge-sm">Desktop Support Technician</span>
                    </td>
                    <td>Purple</td>
                    <th>
                        <button class="btn btn-ghost btn-xs">details</button>
                    </th>
                </tr>
                <!-- row 2 -->
                <tr>
                    <td>
                        <div class="flex items-center space-x-3">
                            <div class="avatar">
                                <div class="mask mask-squircle w-12 h-12">
                                    <img src="/tailwind-css-component-profile-3@56w.png"
                                         alt="Avatar Tailwind CSS Component"/>
                                </div>
                            </div>
                            <div>
                                <div class="font-bold">Brice Swyre</div>
                                <div class="text-sm opacity-50">China</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        Carroll Group
                        <br>
                        <span class="badge badge-ghost badge-sm">Tax Accountant</span>
                    </td>
                    <td>Red</td>
                    <th>
                        <button class="btn btn-ghost btn-xs">details</button>
                    </th>
                </tr>
                <!-- row 3 -->
                <tr>
                    <td>
                        <div class="flex items-center space-x-3">
                            <div class="avatar">
                                <div class="mask mask-squircle w-12 h-12">
                                    <img src="/tailwind-css-component-profile-4@56w.png"
                                         alt="Avatar Tailwind CSS Component"/>
                                </div>
                            </div>
                            <div>
                                <div class="font-bold">Marjy Ferencz</div>
                                <div class="text-sm opacity-50">Russia</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        Rowe-Schoen
                        <br>
                        <span class="badge badge-ghost badge-sm">Office Assistant I</span>
                    </td>
                    <td>Crimson</td>
                    <th>
                        <button class="btn btn-ghost btn-xs">details</button>
                    </th>
                </tr>
                <!-- row 4 -->
                <tr>
                    <td>
                        <div class="flex items-center space-x-3">
                            <div class="avatar">
                                <div class="mask mask-squircle w-12 h-12">
                                    <img src="/tailwind-css-component-profile-5@56w.png"
                                         alt="Avatar Tailwind CSS Component"/>
                                </div>
                            </div>
                            <div>
                                <div class="font-bold">Yancy Tear</div>
                                <div class="text-sm opacity-50">Brazil</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        Wyman-Ledner
                        <br>
                        <span class="badge badge-ghost badge-sm">Community Outreach Specialist</span>
                    </td>
                    <td>Indigo</td>
                    <th>
                        <button class="btn btn-ghost btn-xs">details</button>
                    </th>
                </tr>
                <!-- row 5 -->
                <tr>
                    <td>
                        <div class="flex items-center space-x-3">
                            <div class="avatar">
                                <div class="mask mask-squircle w-12 h-12">
                                    <img src="/tailwind-css-component-profile-5@56w.png"
                                         alt="Avatar Tailwind CSS Component"/>
                                </div>
                            </div>
                            <div>
                                <div class="font-bold">Yancy Tear</div>
                                <div class="text-sm opacity-50">Brazil</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        Wyman-Ledner
                        <br>
                        <span class="badge badge-ghost badge-sm">Community Outreach Specialist</span>
                    </td>
                    <td>Indigo</td>
                    <th>
                        <button class="btn btn-ghost btn-xs">details</button>
                    </th>
                </tr>
                </tbody>
                <!-- foot -->
                <tfoot>
                <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Job</th>
                    <th>Favorite Color</th>
                </tr>
                </tfoot>

            </table>
        </div>
        # Compact table
        NAME JOB


        <c:if test="${!empty latestList}">
            <tr>
                <th>제목</th>
                <th>회원</th>
                <th>별점</th>
                <th>평가</th>
            </tr>
            <c:forEach var="list" items="${latestList}">
                <tr>
                    <td id="bookName${list.isbn}"></td>
                    <td>
                        <c:if test="${list.star==1 }">★☆☆☆☆</c:if>
                        <c:if test="${list.star==2 }">★★☆☆☆</c:if>
                        <c:if test="${list.star==3 }">★★★☆☆</c:if>
                        <c:if test="${list.star==4 }">★★★★☆</c:if>
                        <c:if test="${list.star==5 }">★★★★★</c:if>
                    </td>
                    <td>${list.book_comment}</td>
                    <td>${list.mem_id}</td>
                </tr>
            </c:forEach>
        </c:if>

    </div>


    <c:if test="${!empty allCommentCount}">
        <h2>지금 까지 총 ${allCommentCount}개의 평가가 쌓였어요!</h2>
    </c:if>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        /* Demo purposes only */
        $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            }
        );

        $(document).ready(function () {

            // 최근평가 isbn for문으로 담기
            <c:if test="${!empty latestList}">
            <c:forEach var="latestList" items="${latestList}">
            latestList(${latestList.isbn})
            </c:forEach>
            </c:if>

            // 로그인한 회원의 도서 정보
            <c:if test="${!empty myBookInfo}">
            <c:forEach var="myBookInfo" items="${myBookInfo}">
            myBookInfo(${myBookInfo.isbn})
            </c:forEach>
            </c:if>

            $("#1to5Btn").click(function () {
                $("#1to5Btn").hide();
            });
        });


        function popularList() {

            const isbns = ${popularList_1to5};
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

                        // $("#popularList_1to5").append("<a href='/read/" + book.documents[0].isbn.slice(-13) + "'><img class='h-72 w-48' src='" + book.documents[0].thumbnail + "'/></a>");
                    });
            })
        }

        popularList();

        // $("#popularList_1to5").append("<figure class='snip1368'><a href='/read/" + msg.documents[0].isbn.slice(-13) + "'>" +
        //     "<img class='h-72 w-48' style='-webkit-box-sizing: border-box; box-sizing: border-box; -webkit-transition: all 0.4s ease; transition: all 0.4s ease;'" +
        //     " src='" + msg.documents[0].thumbnail + "'/></a></figure>");

        function popularList_6to10(isbn) {

            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                traditional: true,
                async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                data: {query: isbn},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })
                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    $("#popularList_6to10").append("<a href='/read/" + msg.documents[0].isbn.slice(-13) + "'><img class='h-72 w-48' src='" + msg.documents[0].thumbnail + "'/>");
                });

        }


        // '찜' 도서 목록 불러오기
        function myBookInfo(isbn) {

            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                traditional: true,
                async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                data: {query: isbn},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })
                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    $("#myLike").append("<img src='" + msg.documents[0].thumbnail + "'/>");	//표지
                    $("#myLike").append(msg.documents[0].title);	//제목
                });
        }

        // 최근 평가 도서 불러오기(1개)
        function latestList(isbn) {
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
                    console.log(msg);
                    $("#bookName" + isbn).append(msg.documents[0].title);	//표지
                });
        }
    </script>

</section>

<%@ include file="common/footer.jsp" %>
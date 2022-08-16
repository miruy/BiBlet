<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">
        <div class="card w-full bg-gray-100 shadow-xl p-16">

            <div class="flex flex-col space-y-4">
                <div class="text-2xl mr-2 mb-4">읽고싶어요</div>

                <div class="flex">
                    <div id="allWantRead" class="grid grid-cols-5 gap-8">
                    </div>
                </div>

            </div>

        </div>
    </div>

        <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                // 나의 코멘트
                <c:if test="${!empty wantRead}">
                    <c:forEach var="wantRead" items="${wantRead}">
                    allWantRead(${wantRead})
                    </c:forEach>
                </c:if>
            })


            // 읽고싶어요 전체
            function allWantRead(isbn) {
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
                    let html = '';
                    html += '<div>';
                    html += '<a href="/read/' + isbn + '"><img class="w-56 h-76 shadow-2xl rounded-lg" src="' + msg.documents[0].thumbnail + '"/></a>';
                    html += '</div>';

                    $("#allWantRead").append(html);
                });

            }

        </script>

</section>

<%@ include file="common/footer.jsp" %>
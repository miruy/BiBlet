<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section>

    <div class="hero min-h-screen">
        <div class="hero-content flex-col">
            <div class="flex flex-col items-center mt-6" id="searchBooks"></div>
        </div>
    </div>
    <div id="more_btn"class="text-center w-full py-4 bg-white hover:bg-gray-100">더보기</div>



    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        var pageNum = 1;
        $(document).ready(function () {

            $("#more_btn").click(function () {
                search();
            })



            search();
        });

        function search() {
            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book",
                data: {query: "${query}", page: pageNum},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })
                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    if (msg.documents.length == 0) {
                        $("#more_btn").hide();
                        $("#searchBooks").append("<div>검색에 일치하는 정보를 찾지 못하였습니다.</div>");
                        return;
                    }

                    for (var i = 0; i < 10; i++) {
                        $("#searchBooks").append("<a href='/read/" + msg.documents[i].isbn.slice(-13) + "?query=" + $("#query").val() + "'><img id='searchBook' src='" + msg.documents[i].thumbnail + "' class='max-w-sm rounded-lg shadow-2xl lg:w-70 lg:h-80' /></a><br>");		//표지
                        $("#searchBooks").append("<div class='text-center'><a class='text-3xl font-bold' href='/read/" + msg.documents[i].isbn.slice(-13) + "?query=" + $("#query").val() + "'>" + msg.documents[i].title + "</a></div>");	//제목
                        $("#searchBooks").append("<h5 class='text-xl text-center'>저자: " + msg.documents[i].authors + "</h5><br><br><br>");		//저자
                    }

                    console.log(msg);
                    if(msg.meta.is_end){
                        $("#more_btn").hide();
                    }

                    pageNum = pageNum + 1;
                    console.log(pageNum);
                })
                .fail(function () {
                    $("#more_btn").hide();
                    $("#searchBooks").append("<div>검색에 일치하는 정보를 찾지 못하였습니다.</div>");
                });
        }
    </script>
</section>

<%@ include file="common/footer.jsp" %>
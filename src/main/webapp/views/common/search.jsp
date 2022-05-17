<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="header.jsp" %>

<section>

    <div id="searchBooks"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {

            var pageNum = 1;
            console.log(${query});

            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book",
                data: {query: "${query}", page: pageNum},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })
                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    if (msg.documents.length == 0) {
                        $("#searchBooks").append("<div>검색에 일치하는 정보를 찾지 못하였습니다.</div>");
                        return;
                    }

                    for (var i = 0; i < 10; i++) {
                        $("#searchBooks").append("<img style='width:300px; height:400px;' src='" + msg.documents[i].thumbnail + "' style='text-align:center' /><br>");		//표지
                        $("#searchBooks").append("<h5><a href='/read/" + msg.documents[i].isbn.slice(-13) + "?query=" + $("#query").val() + "'>" + msg.documents[i].title + "</a></h5>");	//제목
                        $("#searchBooks").append("저자: " + msg.documents[i].authors + "<br><br><br>");		//저자
                    }
                })
                .fail(function () {
                    $("#searchBooks").append("<div>검색에 일치하는 정보를 찾지 못하였습니다.</div>");
                });
        });
    </script>
</section>

<%@ include file="../common/footer.jsp" %>
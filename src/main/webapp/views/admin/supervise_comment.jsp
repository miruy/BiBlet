<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>


<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white pt-2 pb-8 pl-8 pr-8">


        <div class="px-10 py-8 my-4 w-full bg-gray-100 admin_font">

            <%--코멘트 관리--%>
            <div id="commentManagement">

                <div id="selectMsg" class="text-gray-500 text-center mb-2">검색 조건 미 선택 시 '이름'으로 검색됩니다.</div>
                <form class="flex flex-row justify-center" name="requestAdmSearch" method="post" action="/admin/supervise_comment">

                    <select id="option" name="option" class="select select-bordered h-[3.6rem] mr-2" onChange="searchStatus()">
                        <option id="default" name="default" value="default" disabled selected>선택</option>
                        <option id="userNo" name="userNo" value="userNo">회원 번호</option>
                        <option id="name" name="name" value="name">이름</option>
                        <option id="id" name="id" value="id">아이디</option>
                        <option id="title" name="title" value="title">제목</option>
                    </select>

                    <div class="relative w-96">
                        <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                            <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                      clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input type="text" name="keyword" id="keyword" value="${keyword}"
                               class="input input-bordered text-gray-900 text-sm p-7 pl-10 w-full" placeholder="코멘트 검색"/>

                        <input type="hidden" id="returnIsbn" name="returnIsbn" value=""/>

                        <input type="submit" id="admin_search" value="검색"
                               class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg"></input>
                    </div>

                </form>
                <div class="my-4">

                    <div class="overflow-x-auto">

                        <div class="flex flex-row space-x-2">
                            <div class="ml-2 mb-2">총 코멘트 수 :</div>
                            <div>${totalComment}</div>
                        </div>

                        <table class="table w-full text-center">
                            <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>프로필</th>
                                <th>이름</th>
                                <th>아이디</th>
                                <th>제목</th>
                                <th>코멘트</th>
                                <th>활성상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${!empty comments}">
                                <c:forEach var="comment" items="${comments}">
                                    <tr class="hover">
                                        <th>
                                                ${comment.userNo}
                                        </th>
                                        <td>
                                            <c:if test="${comment.storedPic eq null}">
                                                <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                                    <svg class="absolute w-12 h-12 ml-9 text-gray-400 pr-2"
                                                         fill="currentColor" viewBox="0 0 20 20"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd"
                                                              d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                                              clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                            </c:if>
                                            <c:if test="${comment.storedPic ne null}">
                                                <c:set var="idSub" value="${fn:substring(comment.id,0,5)}"/>
                                                <c:if test="${idSub ne 'kakao'}">
                                                    <img src="<c:url value='/images/${comment.storedPic}'/>"
                                                         class="mask mask-circle w-10 h-10 ml-9"/>
                                                </c:if>
                                                <c:if test="${idSub eq 'kakao'}">
                                                    <img src="<c:url value='http://${comment.storedPic}'/>"
                                                         class="mask mask-circle w-10 h-10 ml-9"/>
                                                </c:if>
                                            </c:if>
                                        </td>
                                        <td>
                                                ${comment.name}
                                        </td>
                                        <td>
                                                ${comment.id}
                                        </td>
                                        <td id="title${comment.appraisalNo}"></td>
                                        <td class="">
                                          ${comment.comment}
                                        </td>
                                        <td>

                                                <c:if test="${comment.active == 0}">
                                                    <input type="checkbox" id="forcedDisabled_unCheck" class="toggle toggle-md" onclick="forcedDisabled_unCheck(1, ${comment.appraisalNo})"/>
                                                </c:if>
                                                <c:if test="${comment.active == 1}">
                                                    <input type="checkbox" id="forcedDisabled_check" class="toggle toggle-md" onclick="forcedDisabled_check(0, ${comment.appraisalNo})" checked/>
                                                </c:if>

                                        </td>
                                    </tr>


                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>

                </div>


            </div>
        </div>



    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(() => {
            $("#comment_tab").addClass("tab-active");
            $("#comment_Management").addClass("active")
        });

        $(document).ready(() => {
            <c:if test="${!empty comments}">
            <c:forEach var="comment" items="${comments}">
            starManagement("${comment.isbn}", "${comment.appraisalNo}")
            </c:forEach>
            </c:if>
        });


        $("#admin_tab_group > button").click((event) => {
            $("#admin_tab_group > button").removeClass("tab-active");
            $(event.target).addClass("tab-active");

            $("#tab_content_group > div").removeClass("active");

            if (event.target.id == "user_tab") {
                console.log("user_tab 선택함")
                $("#userManagement").addClass("active");
            } else if (event.target.id == "star_tab") {
                console.log("star_tab 선택함")
                $("#starManagement").addClass("active");

            } else if (event.target.id == "comment_tab") {
                console.log("comment_tab 선택함")
                $("#commentManagement").addClass("active");

            } else if (event.target.id == "notice_tab") {
                console.log("notice_tab 선택함")
                $("#noticeManagement").addClass("active");

            } else if (event.target.id == "admin_tab") {
                console.log("comment_tab 선택함")
                $("#adminManagement").addClass("active");

            }
        })

        function starManagement(isbn, appraisalNo){
            var pageNum = 1;
            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book",
                traditional: true,
                async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                data: {query: isbn, page: pageNum},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })

                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);

                    let title = msg.documents[0].title;

                    if(title.length > 18){
                        $("#title" + appraisalNo).append('<textarea rows="1" class="resize-x" disabled>' + msg.documents[0].title + '</textarea>');
                    }else {
                        $("#title" + appraisalNo).append(msg.documents[0].title);
                    }
                });
        }

        let searchStatus = function(){

            $("#selectMsg").hide();

            let select = document.getElementById("option");
            let selectValue = select.options[document.getElementById("option").selectedIndex].value;

            if(selectValue == "title"){

                $("#keyword").on("propertychange change keyup paste input", function(){
                    let keyword = document.getElementById("keyword").value;
                    console.log(keyword);

                    var pageNum = 1;
                    $.ajax({	//카카오 검색요청 / [요청]
                        method: "GET",
                        url: "https://dapi.kakao.com/v3/search/book",
                        traditional: true,
                        async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                        data: {query: keyword, page: pageNum},
                        headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
                    })

                        .done(function (msg) {	//검색 결과 담기 / [응답]
                            console.log(msg);

                            let isbn = msg.documents[0].isbn.slice(-13);

                            document.getElementById('returnIsbn').value = isbn;

                        });
                });

            }
        }

        function forcedDisabled_unCheck(active, appraisalNo){
            // 활성상태 0으로
            console.log(active);
            console.log(appraisalNo);

            $.ajax({
                url: '<c:url value="/admin/disabledComment"/>',
                type: 'POST',
                data: JSON.stringify({
                    "active": active,
                    "appraisalNo": appraisalNo
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function(data) {
                    console.log(data);
                    location.reload();
                }
            });
        }

        function forcedDisabled_check(active, appraisalNo){
            // 활성상태 1로
            console.log(active);
            console.log(appraisalNo);

            $.ajax({
                url: '<c:url value="/admin/disabledComment"/>',
                type: 'POST',
                data: JSON.stringify({
                    "active": active,
                    "appraisalNo": appraisalNo
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function(data) {
                    console.log(data);
                    location.reload();
                }
            });
        }

    </script>
</section>

<%@ include file="../common/footer.jsp" %>
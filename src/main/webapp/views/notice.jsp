<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">

            <div class="card w-full bg-gray-100 shadow-xl p-10">

                <span class="text-xl text-center mb-8">공지사항</span>


                <div id="selectMsg" class="text-gray-500 text-center mb-2">검색 조건 미 선택 시 '제목'으로 검색됩니다.</div>
                <form class="flex flex-row justify-center" name="requestNoticeSearch" method="post" action="/notice_search">

                    <select id="option" name="option" class="select select-bordered h-[3.6rem] mr-2" onChange="searchStatus()">
                        <option id="default" name="default" value="default" disabled selected>선택</option>
                        <option id="noticeNo" name="noticeNo" name="noticeNo">번호</option>
                        <option id="noticeTitle" name="noticeTitle" name="noticeTitle">제목</option>
                    </select>

                    <div class="relative w-96">
                        <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                            <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                        </div>
                        <input type="text" name="keyword" id="keyword" value="${keyword}" class="input input-bordered text-gray-900 text-sm p-7 pl-10 w-full" placeholder="공지사항 검색" />
                        <input type="submit" id="noticeSearch" value="검색" class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg" />
                    </div>

                </form>


                <div class="overflow-x-auto w-full">

                    <div class="flex flex-row space-x-2">
                        <div class="ml-2 mb-2">전체 글 :</div>
                        <div>${noticeCount}</div>
                    </div>


                    <c:if test="${!empty noticeList}">
                        <table class="table w-full">
                            <thead>
                            <tr class="text-center">
                                <th class="text-lg">공지번호</th>
                                <th class="text-lg">작성자</th>
                                <th class="text-lg">제목</th>
                                <th class="text-lg">작성일</th>
                                <th class="text-lg">조회수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="notice" items="${noticeList}">
                                <tr>
                                    <td class="justify-center items-center text-center">
                                       ${notice.noticeNo}
                                    </td>
                                    <td class="justify-center items-center text-center">
                                        ${notice.writer}
                                    </td>
                                    <td class="justify-center items-center text-center">
                                        <a href="/notice_${notice.noticeNo}">${notice.title}</a>
                                    </td>
                                    <td class="justify-center items-center text-center">
                                        <fmt:parseDate value="${notice.writeDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                                    </td>
                                    <td class="justify-center items-center text-center">
                                        ${notice.count}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>



                <form method="post" id="requestPageChange" name="requestPageChange" class="btn-group mx-auto mt-8">
                    <input type="radio" id="page1_tab" name="page" data-title="1" value=1 class="btn btn-secondary text-white hover:text-white" onclick="submit_page()" />
                    <input type="radio" id="page2_tab" name="page" data-title="2" value=2 class="btn btn-secondary text-white hover:text-white" onclick="submit_page()" />
                    <input type="radio" id="page3_tab" name="page" data-title="3" value=3 class="btn btn-secondary text-white hover:text-white" onclick="submit_page()" />
                </form>


            </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(function () {
            $("#page1_tab").prop("checked", true);
<%--            <c:forEach var="notice" items="${noticeList}" varStatus="status">--%>
<%--                <c:if test="${notice.noticeNo <= 10}">--%>
<%--                  $("#page3_tab").prop("checked", true);--%>
<%--                </c:if>--%>

<%--                <c:if test="${notice.noticeNo > 10 && notice.noticeNo <= 20}">--%>
<%--                  $("#page2_tab").prop("checked", true);--%>
<%--                </c:if>--%>

<%--                <c:if test="${notice.noticeNo > 20 && notice.noticeNo <= 30}">--%>
<%--                    $("#page1_tab").prop("checked", true);--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>


        })

        function submit_page(){
            document.getElementById("requestPageChange").submit();
        }
    </script>

</section>

<%@ include file="common/footer.jsp" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">

            <div class="card w-full bg-gray-100 shadow-xl p-10">

                <c:if test="${!empty adminPageNoticeDetail}">
                    <c:forEach var="adminPageNotice" items="${adminPageNoticeDetail}">

                    <table class="table w-full">
                        <thead>
                        <tr class="text-center">
                            <th class="text-lg">제목</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="justify-center items-center text-center">
                                ${adminPageNotice.title}
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="mt-4 table w-full">
                        <thead>
                        <tr class="text-center">
                            <th class="text-sm">공지번호</th>
                            <th class="text-sm">작성자</th>
                            <th class="text-sm">작성일</th>
                            <th class="text-sm">조회수</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <td class="justify-center items-center text-center text-sm">
                                    ${adminPageNotice.noticeNo}
                            </td>
                            <td class="justify-center items-center text-center text-sm">
                                    ${adminPageNotice.writer}
                            </td>
                            <td class="justify-center items-center text-center text-sm">
                                <fmt:parseDate value="${adminPageNotice.writeDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
                            </td>
                            <td class="justify-center items-center text-center text-sm">
                                    ${adminPageNotice.count}
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <c:if test="${!empty adminPageNotice.originFile}">
                        <div class="flex flex-row justify-end mt-4 space-x-2">
                            <div class="mt-1">${adminPageNotice.originFile}</div>
                            <form method="get" action="/file_download">
                                <input type="hidden" id="storedFile" name="storedFile" value="${adminPageNotice.storedFile}">
                                <button type="submit" class="btn btn-sm btn-secondary text-white hover:text-white capitalize">download</button>
                            </form>
                        </div>

                        <div class="rounded-lg bg-white p-2 w-full h-[50rem] overflow-auto">
                            <div>${adminPageNotice.content}</div>
                        </div>
                    </c:if>

                    <c:if test="${empty adminPageNotice.originFile}">
                        <div class="rounded-lg bg-white p-2 mt-4 w-full h-[50rem] overflow-auto">
                            <div>${adminPageNotice.content}</div>
                        </div>
                    </c:if>


                    </c:forEach>
                </c:if>


            </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(() => {
            $("#notice_tab").addClass("tab-active");
            $("#noticeManagement").addClass("active");
        });

    </script>

</section>

<%@ include file="../common/footer.jsp" %>
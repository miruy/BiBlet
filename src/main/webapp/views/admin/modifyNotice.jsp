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

            <div class="flex flex-col">
                <c:if test="${!empty modifyNoticeDetail}">
                    <c:forEach var="modifyNotice" items="${modifyNoticeDetail}">

                        <form:form modelAttribute="requestWriteNotice" method="post" action="/admin/modifyNotice_${modifyNotice.noticeNo}" enctype="multipart/form-data">

                            <div class="mb-4">
                                <div class="text-center"><form:errors path="content"/></div>
                            </div>

                            <div class="space-y-2">
                                <div class="form-control">
                                    <label class="input-group input-group-md">
                                        <span class="text-gray-600 w-40 justify-center">제목</span>
                                        <input type="text" placeholder="${modifyNotice.title}" name="title" id="title"
                                               class="input input-bordered input-md w-full">
                                    </label>
                                </div>

                                <div class="form-control flex flex-row space-x-2">
                                    <label class="input-group input-group-md">
                                        <span class="text-gray-600 w-40 justify-center">첨부파일</span>
                                        <input type="file" id="noticeFile" name="noticeFile"
                                               class="input input-bordered text-center w-full"/>
                                    </label>
                                    <label for="noticeFile"
                                           class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black">선택</label>
                                </div>

                                <c:if test="${!empty modifyNotice.originFile}">
                                    <div class="flex flex-row justify-end mt-4 space-x-2">
                                        <div class="mt-1">${modifyNotice.originFile}</div>
                                        <form method="get" action="/file_download">
                                            <input type="hidden" id="storedFile" name="storedFile"
                                                   value="${modifyNotice.storedFile}">
                                            <button type="submit"
                                                    class="btn btn-sm btn-secondary text-white hover:text-white capitalize">
                                                download
                                            </button>
                                        </form>

                                        <button type="button" onclick="fileDeleteBtn(${modifyNotice.noticeNo})"
                                                class="btn btn-sm bg-white border-white hover:border-secondary hover:bg-white text-purple-600 hover:text-purple-600 capitalize">
                                            File Delete
                                        </button>

                                    </div>

                                    <div class="rounded-lg bg-white p-2 w-full h-[45rem] overflow-auto">
                                        <textarea id="contentWithFile" name="content" class="textarea textarea-bordered"
                                                  placeholder="${modifyNotice.content}"></textarea>
                                    </div>
                                </c:if>

                                <c:if test="${empty modifyNotice.originFile}">
                                    <div class="rounded-lg bg-white p-2 mt-4 w-full h-[45rem] overflow-auto">
                                        <textarea id="content" name="content" class="textarea textarea-bordered"
                                                  placeholder="${modifyNotice.content}"></textarea>
                                    </div>
                                </c:if>

                                <input type="hidden" id="noticeNo" name="noticeNo" value="${modifyNotice.noticeNo}">
                                <input type="submit" value="저장"
                                       class="btn btn-secondary text-white hover:text-white px-20"
                                       onclick="confirm('공지사항을 수정하시겠습니까?')" />
                            </div>
                        </form:form>

                    </c:forEach>
                </c:if>
            </div>

        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(() => {
            $("#notice_tab").addClass("tab-active");
            $("#noticeManagement").addClass("active");
        });

        $(function () {
            CKEDITOR.replace('content', {
                filebrowserUploadUrl: "${pageContext.request.contextPath}/ckImageUpload",
                height: 500
            });
        });

        $(function () {
            CKEDITOR.replace('contentWithFile', {
                filebrowserUploadUrl: "${pageContext.request.contextPath}/ckImageUpload",
                height: 500
            });
        });

        function fileDeleteBtn(noticeNo){
            $.ajax({
                url: '<c:url value="/admin/updateFileToNull"/>',
                type: 'POST',
                data: JSON.stringify({
                    "noticeNo": noticeNo
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log(data);
                }, error: function (map) {
                    console.log("에러");
                }

            });
        }
    </script>

</section>

<%@ include file="../common/footer.jsp" %>
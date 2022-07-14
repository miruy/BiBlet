<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white pt-2 pb-8 pl-8 pr-8">
        <div class="px-20 py-8 my-4 w-full bg-gray-100 admin_font">

            <div class="flex flex-col">

                <form:form modelAttribute="requestWriteNotice" method="post" action="/admin/writeNotice" enctype="multipart/form-data">

                    <div class="mb-4">
                        <div class="text-center"><form:errors path="title" /></div>
                        <div class="text-center"><form:errors path="content" /></div>
                    </div>

                    <div class="space-y-2">
                        <div class="form-control">
                            <label class="input-group input-group-md">
                                <span class="text-gray-600 w-40 justify-center">제목</span>
                                <input type="text" name="title" id="title" class="input input-bordered input-md w-full" />
                            </label>
                        </div>

                        <div class="form-control flex flex-row space-x-2">
                            <label class="input-group input-group-md">
                                <span class="text-gray-600 w-40 justify-center">첨부파일</span>
                                <input type="file" id="noticeFile" name="noticeFile" class="input input-bordered text-center w-full" />
                            </label>
                            <label for="noticeFile" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black">선택</label>
                        </div>

                        <textarea id="content" name="content" class="textarea textarea-bordered"></textarea>

                        <input type="submit" value="저장" class="btn btn-secondary text-white hover:text-white px-20" onclick="confirm('공지사항을 올리겠습니까?')"></input>
                    </div>
                </form:form>

            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(() => {
            $("#notice_tab").addClass("tab-active");
            $("#noticeManagement").addClass("active");
        });


        $(function(){
            CKEDITOR.replace('content', {
                filebrowserUploadUrl: "${pageContext.request.contextPath}/ckImageUpload",
            height : 500
            });
        });

        function writeNoticeBtn(){
            let title = $("#title").val();
            let content = CKEDITOR.instances.content.getData();

            console.log(title);
            console.log(content);


            if(confirm("공지사항을 올리겠습니까?")){
            }
        }
    </script>
</section>

<%@ include file="../common/footer.jsp" %>
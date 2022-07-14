<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">
        <div class="card w-full bg-gray-50 shadow-2xl p-8">

                <div class="text-gray-600 mb-6 text-center text-3xl font-bold">회원정보 수정</div>

                <div id="profile" class="mx-auto mb-6">

                    <c:if test="${myInfo2.storedPic eq null}">
                        <label class="mx-auto" for="file">
                            <div class="relative w-[12rem] h-[12rem] overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                <svg class="absolute w-[14rem] h-[14rem] text-gray-400 -left-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                            </div>
                        </label>
                    </c:if>
                    <c:if test="${myInfo2.storedPic ne null}">
                        <c:set var="idSub" value="${fn:substring(myInfo2.id,0,5)}"/>
                        <c:if test="${idSub ne 'kakao'}">
                            <label class="mx-auto" for="file">
                                <img src="<c:url value='/images/${myInfo2.storedPic}'/>" class="mask mask-circle mx-auto w-[12rem] h-[12rem]"/>
                            </label>
                        </c:if>
                        <c:if test="${idSub eq 'kakao'}">
                            <label class="mx-auto" for="file">
                                <img src="<c:url value='http://${myInfo2.storedPic}'/>" class="mask mask-circle mx-auto w-[12rem] h-[12rem]"/>
                            </label>
                        </c:if>
                    </c:if>

                </div>

                <c:set var="idSub" value="${fn:substring(myInfo2.id,0,5)}"/>
                <c:if test="${idSub ne 'kakao'}">
                    <button id="defaultProfile" type="button" class="btn btn btn-ghost w-44 mx-auto mb-4" onclick="changedDefaultProfile(${myInfo2.userNo})">기본 프로필로 돌아가기</button>
                </c:if>

                <div class="mx-auto">
                    <div class="overflow-x-auto">

                            <form:form modelAttribute="requestUpdateUserInfo" method="post" action="edit" enctype="multipart/form-data">

                            <div class="space-y-4">
                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center">Name</span>
                                        <input type="text" placeholder="${myInfo2.name}" class="input input-bordered placeholder-black text-lg text-center w-80" readonly />
                                    </label>
                                </div>

                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center">ID</span>
                                        <form:input type="text" path="id" id="id" name="id" placeholder="${myInfo2.id}" class="input input-bordered text-lg text-center w-80" />
                                    </label>
                                    <label class="text-center"><form:errors path="id" /></label>
                                </div>


                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center">Email</span>
                                        <form:input type="text" path="email" id="email" name="email" placeholder="${myInfo2.email}" class="input input-bordered text-lg text-center w-80" />
                                    </label>
                                    <label class="text-center"><form:errors path="email" /></label>
                                </div>

                                <div class="form-control flex flex-row space-x-2">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center text-center text-sm">Existing password</span>
                                        <input type="password" id="passCheck" name="passCheck" placeholder="기존 비밀번호" class="input input-bordered text-lg text-center w-80" />
                                        <input type="hidden" name="pass" id="pass" value="${myInfo2.pass}" />
                                    </label>
                                    <button type="button" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black" onClick="passCheckBtn(${myInfo2.userNo})">비밀번호 확인</button>
                                </div>

                                <div id="passUpdateForm" class="form-control">
                                        <label class="input-group">
                                            <span class="inputTitle text-black w-24 justify-center text-center text-sm">Change password</span>
                                            <input type="password" id="newPass" name="newPass" placeholder="변경 비밀번호" class="input input-bordered text-lg text-center w-80" />
                                        </label>
                                </div>

                                <div class="form-control flex flex-row space-x-2">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center">Profile</span>
                                        <input type="file" id="file" name="file" class="input input-bordered text-lg text-center w-80" />
                                    </label>
                                    <label for="file" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black">선택</label>
                                </div>

                                <button type="submit" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-44 ml-[10rem]">저장</button>
                            </div>

                            </form:form>

                    </div>
                </div>



        </div>
    </div>
    <script>

        $(document).ready(function () {
            $("#passUpdateForm").hide();
        })

        $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });


        function passCheckBtn(userNo){

            let passCheck = $("#passCheck").val();
            let pass = $("#pass").val();

            $.ajax({
                url: '<c:url value="/editPassCheck"/>',
                type: 'POST',
                data: JSON.stringify({
                    "passCheck": passCheck,
                    "pass": pass
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function(data) {
                    if(data == 1){
                        alert("비밀번호가 확인되었습니다.");

                        $("#passUpdateForm").show();

                    }else if(data == 0){
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                }
            });
        }

        function changedDefaultProfile(userNo) {

            $.ajax({
                url: '<c:url value="/changedDefaultProfile"/>',
                type: 'POST',
                data: JSON.stringify({
                    "userNo": userNo
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function (data) {
                    console.log("성공");
                    location.reload();
                }, error: function (data) {
                    console.log("에러" + data);
                }
            });

        }

    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</section>

<%@ include file="common/footer.jsp" %>
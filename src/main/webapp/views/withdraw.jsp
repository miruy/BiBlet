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

            <div class="text-gray-600 mb-6 text-center text-3xl font-bold">회원 탈퇴</div>

            <c:set var="idSub" value="${fn:substring(userInfo.id,0,5)}"/>
            <c:if test="${idSub ne 'kakao'}">
                <div class="mx-auto">
                    <div class="overflow-x-auto">

                        <div class="space-y-8">

                            <div class="form-control flex flex-row space-x-2">
                                <label class="input-group">
                                    <span class="inputTitle text-black w-24 justify-center text-center text-sm">Existing password</span>
                                    <input type="password" id="passCheck" name="passCheck" placeholder="기존 비밀번호"
                                           class="input input-bordered text-lg text-center w-80"/>
                                    <input type="hidden" name="pass" id="pass" value="${userInfo.pass}"/>
                                </label>
                                <button type="button"
                                        class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black"
                                        onClick="passCheckBtn()">비밀번호 확인
                                </button>
                            </div>


                            <div id="withdrawConfirm" class="mx-auto flex flex-col space-y-8">
                                <span class="text-black text-2xl">회원님의 모든 정보가 삭제됩니다. 탈퇴를 진행하시겠습니까?</span>

                                <div class="flex flex-row space-x-16 > * justify-center">
                                    <div class="text-gray-400 hover:text-purple-600 pt-2"
                                         onclick="withdraw(${userInfo.userNo})">
                                        <svg class="w-10 h-10" viewBox="0 0 21 21" xmlns="http://www.w3.org/2000/svg">
                                            <g fill="none" fill-rule="evenodd" transform="translate(2 2)">
                                                <path d="m8.5 16.5c4.418278 0 8-3.581722 8-8s-3.581722-8-8-8-8 3.581722-8 8 3.581722 8 8 8z"
                                                      stroke="currentColor" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                                <circle cx="6" cy="6" fill="currentColor" r="1"/>
                                                <circle cx="11" cy="6" fill="currentColor" r="1"/>
                                                <path d="m5.5 11.5c.60286458-1.3333333 1.60286458-2 3-2s2.3971354.6666667 3 2"
                                                      stroke="currentColor" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                            </g>
                                        </svg>
                                        <div class="text-sm ml-[0.5rem]">탈퇴</div>
                                    </div>

                                    <div class="pt-2 text-gray-400 hover:text-pink-600" onclick="location.href='/'">
                                        <svg class="hover:text-pink-600 w-10 h-10" viewBox="0 0 21 21" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd" transform="translate(2 2)"><circle cx="8.5" cy="8.5" r="8" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><circle cx="6" cy="6" fill="currentColor" r="1"/><circle cx="11" cy="6" fill="currentColor" r="1"/><path d="m5.5 9.5c.60286458 1.3333333 1.60286458 2 3 2s2.3971354-.6666667 3-2" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/></g></svg>
                                        <div class="text-sm ml-[0.5rem]">취소</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${idSub eq 'kakao'}">
                <div class="mx-auto flex flex-col space-y-8">
                    <span class="text-black text-2xl">회원님의 모든 정보가 삭제됩니다. 탈퇴를 진행하시겠습니까?</span>
                    <div class="flex flex-row space-x-16 > * justify-center">

                        <div class="text-gray-400 hover:text-purple-600 pt-2" onclick="withdraw(${userInfo.userNo})">
                            <svg class="w-10 h-10" viewBox="0 0 21 21" xmlns="http://www.w3.org/2000/svg">
                                <g fill="none" fill-rule="evenodd" transform="translate(2 2)">
                                    <path d="m8.5 16.5c4.418278 0 8-3.581722 8-8s-3.581722-8-8-8-8 3.581722-8 8 3.581722 8 8 8z"
                                          stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/>
                                    <circle cx="6" cy="6" fill="currentColor" r="1"/>
                                    <circle cx="11" cy="6" fill="currentColor" r="1"/>
                                    <path d="m5.5 11.5c.60286458-1.3333333 1.60286458-2 3-2s2.3971354.6666667 3 2"
                                          stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/>
                                </g>
                            </svg>
                            <span class="text-sm ml-[0.5rem]">탈퇴</span>
                        </div>

                        <div class="pt-2 text-gray-400 hover:text-pink-600" onclick="location.href='/'">
                            <svg class="hover:text-pink-600 w-10 h-10" viewBox="0 0 21 21" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd" transform="translate(2 2)"><circle cx="8.5" cy="8.5" r="8" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/><circle cx="6" cy="6" fill="currentColor" r="1"/><circle cx="11" cy="6" fill="currentColor" r="1"/><path d="m5.5 9.5c.60286458 1.3333333 1.60286458 2 3 2s2.3971354-.6666667 3-2" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/></g></svg>
                            <span class="text-sm ml-[0.5rem]">취소</span>
                        </div>

                    </div>
                </div>
            </c:if>


        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $("#withdrawConfirm").hide();
        })

        function passCheckBtn() {

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
                success: function (data) {
                    if (data == 1) {
                        alert("비밀번호가 확인되었습니다.");
                        $("#withdrawConfirm").show();
                    } else if (data == 0) {
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                }
            });
        }

        function withdraw(userNo) {

            $.ajax({
                url: '<c:url value="/withdrawUserInfo"/>',
                type: 'POST',
                data: JSON.stringify({
                    "userNo": userNo
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function (data) {
                    window.location.href = "/";
                }, error: function (data) {
                    window.location.href = "/";
                }
            });
        }

    </script>

</section>

<%@ include file="common/footer.jsp" %>
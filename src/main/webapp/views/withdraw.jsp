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
                                    <input type="password" id="passCheck" name="passCheck" placeholder="기존 비밀번호" class="input input-bordered text-lg text-center w-80" />
                                    <input type="hidden" name="pass" id="pass" value="${userInfo.pass}" />
                                </label>
                                <button type="button" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black" onClick="passCheckBtn()">비밀번호 확인</button>
                            </div>


                            <div id="withdrawConfirm" class="mx-auto flex flex-col space-y-8">
                                <span class="text-black text-2xl">회원님의 모든 정보가 삭제됩니다. 탈퇴를 진행하시겠습니까?</span>
                                <div class="flex flex-row space-x-16 > * justify-center">
                                    <div class="text-gray-400 hover:text-purple-600 pt-1" onclick="withdraw(${userInfo.userNo})">
                                        <svg height="45" viewBox="0 0 21 21" width="50" xmlns="http://www.w3.org/2000/svg">
                                            <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(4 3)">
                                                <path d="m1.25 6.25c.72440521-.14488104 1.44906675.24766687 1.72343208.93358019l.52656792 1.31641981v-6c0-.55228475.44771525-1 1-1s1 .44771525 1 1v-1.5c0-.55228475.44771525-1 1-1s1 .44771525 1 1v1c0-.55228475.44771525-1 1-1s1 .44771525 1 1v1.5c0-.55228475.44771525-1 1-1 .5522847 0 1 .44771525 1 1v8c0 2.209139-1.790861 4-4 4-2.3508274 0-4.39998311-1.5999324-4.9701425-3.88057l-.0298575-.11943-1.92991229-3.85982457c-.24048169-.48096339-.04553276-1.06581018.43543063-1.30629188.07740388-.03870194.15962204-.06691163.24448166-.08388355z"/><path d="m5.5 1.5v6"/><path d="m7.5 1.5v5"/><path d="m9.5 3.5v4"/>
                                            </g>
                                        </svg>
                                        <span class="ml-2">탈퇴</span>
                                    </div>

                                    <div class="pt-2 text-gray-400 hover:text-pink-600" onclick="location.href='/'">
                                        <svg height="40" class="hover:text-pink-600" viewBox="0 0 21 21" width="40" xmlns="http://www.w3.org/2000/svg">
                                            <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(1 1)">
                                                <path d="m.5 9.5 9-9 9 9"/><path d="m2.5 7.5v8c0 .5522847.44771525 1 1 1h3c.55228475 0 1-.4477153 1-1v-4c0-.5522847.44771525-1 1-1h2c.5522847 0 1 .4477153 1 1v4c0 .5522847.4477153 1 1 1h3c.5522847 0 1-.4477153 1-1v-8"/>
                                            </g>
                                        </svg>
                                        <span class="ml-2">취소</span>
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
                        <div class="text-gray-400 hover:text-purple-600 pt-1" onclick="withdraw(${userInfo.userNo})">
                            <svg height="45" viewBox="0 0 21 21" width="50" xmlns="http://www.w3.org/2000/svg">
                                <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(4 3)">
                                    <path d="m1.25 6.25c.72440521-.14488104 1.44906675.24766687 1.72343208.93358019l.52656792 1.31641981v-6c0-.55228475.44771525-1 1-1s1 .44771525 1 1v-1.5c0-.55228475.44771525-1 1-1s1 .44771525 1 1v1c0-.55228475.44771525-1 1-1s1 .44771525 1 1v1.5c0-.55228475.44771525-1 1-1 .5522847 0 1 .44771525 1 1v8c0 2.209139-1.790861 4-4 4-2.3508274 0-4.39998311-1.5999324-4.9701425-3.88057l-.0298575-.11943-1.92991229-3.85982457c-.24048169-.48096339-.04553276-1.06581018.43543063-1.30629188.07740388-.03870194.15962204-.06691163.24448166-.08388355z"/><path d="m5.5 1.5v6"/><path d="m7.5 1.5v5"/><path d="m9.5 3.5v4"/>
                                </g>
                            </svg>
                            <span class="ml-2">탈퇴</span>
                        </div>

                        <div class="pt-2 text-gray-400 hover:text-pink-600" onclick="location.href='/'">
                            <svg height="40" class="hover:text-pink-600" viewBox="0 0 21 21" width="40" xmlns="http://www.w3.org/2000/svg">
                                <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" transform="translate(1 1)">
                                    <path d="m.5 9.5 9-9 9 9"/><path d="m2.5 7.5v8c0 .5522847.44771525 1 1 1h3c.55228475 0 1-.4477153 1-1v-4c0-.5522847.44771525-1 1-1h2c.5522847 0 1 .4477153 1 1v4c0 .5522847.4477153 1 1 1h3c.5522847 0 1-.4477153 1-1v-8"/>
                                </g>
                            </svg>
                            <span class="ml-2">취소</span>
                        </div>
                    </div>
                </div>
            </c:if>





        </div>
    </div>
            <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <script>
                $(document).ready(function () {
                    $("#withdrawConfirm").hide();
                })

                function passCheckBtn(){

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
                                $("#withdrawConfirm").show();
                            }else if(data == 0){
                                alert("비밀번호가 일치하지 않습니다.");
                            }
                        }
                    });
                }

                function withdraw(userNo){

                    $.ajax({
                        url: '<c:url value="/withdrawUserInfo"/>',
                        type: 'POST',
                        data: JSON.stringify({
                            "userNo": userNo
                        }),
                        dataType: "json",
                        contentType: 'application/json',
                        success: function(data) {
                            window.location.href = "/";
                        }, error: function(data){
                            window.location.href = "/";
                        }
                    });
                }

            </script>

</section>

<%@ include file="common/footer.jsp" %>
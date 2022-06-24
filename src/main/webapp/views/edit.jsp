<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">
        <div class="card w-full bg-gray-50 shadow-2xl p-8">

                <div class="text-gray-600 mb-6 text-center text-3xl font-bold">회원정보 수정</div>

                <div class="mx-80 pl-10 mb-6">
                    <div class="avatar">
                        <div class="rounded-full">

                            <c:if test="${myInfo.storedPic eq null}">
                                <div class="relative w-60 h-60 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                    <svg class="absolute w-64 h-64 text-gray-400 -left-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                                </div>
                            </c:if>

                            <c:if test="${myInfo.storedPic ne null}">
                                <img src="<c:url value='/images/${myInfo.storedPic}'/>" />
                            </c:if>

                        </div>
                    </div>
                </div>

                <div class="mx-60 pl-2">
                    <div class="overflow-x-auto">

                            <form:form modelAttribute="requestSignup" method="post" action="edit">

                            <div class="space-y-4">
                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center">Name</span>
                                        <input type="text" placeholder="${myInfo2.id}" class="input input-bordered placeholder-black text-lg text-center w-80" readonly />
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

                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-24 justify-center">Password</span>
                                        <form:input type="password" path="pass" id="passCheck" name="pass" class="input input-bordered text-lg text-center w-80" />
                                        <input type="hidden" name="pass" id="pass" value="${myInfo2.pass}" />
                                        <button type="button" class="btn btn-square w-24 bg-gray-200 border-gray-200" onClick="passCheckBtn(${myInfo2.userNo})">비밀번호 확인</button>
                                    </label>
                                    <label class="text-center"><form:errors path="email" /></label>
                                </div>

                                <button type="submit" class="btn btn-secondary hover:bg-purple-600 hover:text-white w-44 ml-[8rem]">저장</button>
                            </div>


                            </form:form>

                    </div>
                </div>



        </div>
    </div>
            <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <script>

                function passCheckBtn(userNo){

                    let passCheck = $("#passCheck").val();
                    let pass = $("#pass").val();

                    $.ajax({
                        url: '<c:url value="/editPassCheck"/>',
                        type: 'POST',
                        data: JSON.stringify({
                            "userNo": userNo,
                            "passCheck": passCheck,
                            "pass": pass
                        }),
                        dataType: "json",
                        contentType: 'application/json',
                        success: function(data) {
                            if(data == 1){
                                alert("비밀번호가 확인되었습니다.");

                                passUpdateForm(mem_num);

                            }else if(data == 0){
                                alert("비밀번호가 일치하지 않습니다.");
                            }
                        }
                    });
                }

                $(document).ready(function () {

                })


            </script>

</section>

<%@ include file="common/footer.jsp" %>
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

                <div class="mx-80 pl-2">
                    <div class="overflow-x-auto">

                            <form:form modelAttribute="requestSignup" method="post" action="edit">
                            <div class="space-y-4">
                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-20">Name</span>
                                        <input type="text" placeholder="${myInfo2.id}" class="input input-bordered placeholder-black text-lg text-center" readonly />
                                    </label>
                                </div>

                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-20">ID</span>
                                        <form:input type="text" path="id" id="id" name="id" placeholder="${myInfo2.id}" class="input input-bordered text-lg text-center" />
                                    </label>
                                    <label class="text-center"><form:errors path="id" /></label>
                                </div>


                                <div class="form-control">
                                    <label class="input-group">
                                        <span class="inputTitle text-black w-20">Email</span>
                                        <form:input type="text" path="email" id="email" name="email" placeholder="${myInfo2.email}" class="input input-bordered text-lg text-center" />
                                    </label>
                                    <label class="text-center"><form:errors path="email" /></label>
                                </div>
                            </div>


                                <button type="submit" class="btn btn-secondary hover:bg-purple-600 hover:text-white">저장
                                </button>

                            </form:form>

                    </div>
                </div>



        </div>
    </div>
            <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
            <script>

                $(document).ready(function () {

                })


            </script>

</section>

<%@ include file="common/footer.jsp" %>
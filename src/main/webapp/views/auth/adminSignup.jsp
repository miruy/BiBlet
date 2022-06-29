<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">
        <div class="text-center mb-[0.7rem]">
            <h1 class="text-4xl font-bold">Administrator Sign Up</h1>
        </div>
        <div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
            <form:form modelAttribute="requestAdmSignup" class="card-body lg:px-[10%]">
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Name</span>
                    </label>
                    <form:input type="text" path="admName" id="admName" name="admName" class="input input-bordered" />
                    <label class="text-center"><form:errors path="admName" /></label>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <form:input type="text" path="admId" id="admId" name="admId" class="input input-bordered"/>
                    <label class="text-center"><form:errors path="admId" /></label>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <form:input type="password" path="admPass" id="admPass" name="admPass" class="input input-bordered"/>
                    <label class="text-center"><form:errors path="admPass" /></label>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Email</span>
                    </label>
                    <form:input type="text" path="admEmail" id="admEmail" name="admEmail" class="input input-bordered"/>
                    <label class="text-center"><form:errors path="admEmail" /></label>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Security Code</span>
                    </label>
                    <form:input type="text" path="securitycode" id="securitycode" name="securitycode" class="input input-bordered"/>
                    <label class="text-center"><form:errors path="securitycode" /></label>
                </div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary text-gray-600 hover:text-white">Sign Up</button>
                </div>

            </form:form>
        </div>
    </div>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">


    </script>
</section>

<%@ include file="../common/footer.jsp" %>
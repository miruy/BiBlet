<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">
        <div class="text-center mb-[0.7rem]">
            <h1 class="text-4xl font-bold">Administrator Login</h1>
        </div>
        <div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
            <form:form modelAttribute="requestAdmLogin" class="card-body lg:px-[10%]" method="post">
                <form:errors />

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <form:input path="admId" id="admId" name="admId" type="text" class="input input-bordered"/>
                    <div class="text-center"><form:errors path="admId" /></div>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <form:input type="password" path="admPass" id="admPass" name="admPass" class="input input-bordered"/>
                    <div class="text-center"><form:errors path="admPass" /></div>
                </div>

                <div class="text-center"><form:errors path="commonError" /></div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary text-gray-600 hover:text-white">Login</button>
                </div>


            </form:form>
        </div>
    </div>

</section>

<%@ include file="../common/footer.jsp" %>
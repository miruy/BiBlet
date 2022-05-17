<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">
        <div class="text-center mb-[0.7rem]">
            <h1 class="text-4xl font-bold">Login</h1>
        </div>
        <div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
            <form:form modelAttribute="requestLogin" class="card-body lg:px-[10%]">
                <form:errors />

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <form:input path="id" id="id" name="id" type="text" class="input input-bordered"/>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <form:input type="password" path="pass" id="pass" name="pass" class="input input-bordered"/>
                    <form:errors path="pass" />
                </div>

                <div class="form-control">
                    <label class="label cursor-pointer">
                        <span class="label-text">Remember me</span>
                        <input type="checkbox" id="rememberId" name="rememberId" class="checkbox checkbox-secondary">
                    </label>
                </div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary">Login</button>
                </div>
                <a href="/adimSLogin" class="text-center">Administrator Login</a>

                <a href="/login/findId" class="mt-3" >Forgot your id?</a>
                <a href="/login/findPass" >Forgot your password?</a>
            </form:form>
        </div>
    </div>

    <script type="text/javascript">
        if(${!empty sessionScope.authInfo}){
            window.history.forward();
        }
    </script>
</section>

<%@ include file="../common/footer.jsp" %>
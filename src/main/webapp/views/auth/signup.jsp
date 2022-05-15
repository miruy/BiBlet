<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">
    <div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">
        <div class="text-center mb-[0.7rem]">
            <h1 class="text-4xl font-bold">Sign Up</h1>
        </div>
        <div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
            <form:form modelAttribute="requestSignup" class="card-body lg:px-[10%]">
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Name</span>
                    </label>
                    <form:input type="text" path="name" id="name" name="name" limitbyte="50" placeholder="한글 6자, 영문50자 이내" class="input input-bordered" />
                    <form:errors path="name" />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <form:input type="text" path="id" id="id" name="id" limitbyte="100" placeholder="한글 33자, 영문100자 이내" class="input input-bordered"/>
                    <form:errors path="id" />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <form:input type="password" path="pass" id="pass" name="pass" limitbyte="200" placeholder="한글 66자, 영문200자 이내" class="input input-bordered"/>
                    <form:errors path="pass" />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Email</span>
                    </label>
                    <form:input type="email" path="email" id="email" name="email" class="input input-bordered"/>
                    <form:errors path="email" />
                </div>

                <div class="form-control mt-6">
                    <button class="btn btn-primary">Kakao Login</button>
                </div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary">Sign Up</button>
                </div>
                <label><form:errors path="commonError"/></label>
            </form:form>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
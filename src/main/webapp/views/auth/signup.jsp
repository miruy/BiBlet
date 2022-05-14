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
            <form:form  commandName="requestSignup" class="card-body lg:px-[10%]">
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Name</span>
                    </label>
                    <input type="text" id="name" name="name" limitbyte="50" placeholder="한글 6자, 영문50자 이내" class="input input-bordered" />
                </div>
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <input type="text"  id="id" name="id" limitbyte="100" placeholder="한글 33자, 영문100자 이내" class="input input-bordered"/>
                </div>
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <input type="password" id="pass" name="pass" limitbyte="200" placeholder="한글 66자, 영문200자 이내" class="input input-bordered"/>
                </div>
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Email</span>
                    </label>
                    <input type="email" id="email" name="email" class="input input-bordered"/>
                </div>

                <div class="form-control mt-6">
                    <button class="btn btn-primary">Kakao Login</button>
                </div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary">Sign Up</button>
                </div>
            </form:form>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
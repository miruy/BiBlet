<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../common/header.jsp" %>

<section>

    <div class="hero min-h-screen" style="background-image: url('/images/home-bg.jpg');">
        <div class="hero-overlay bg-opacity-60"></div>
        <div class="hero-content text-center text-neutral-content">
            <div class="max-w-md">
                <h1 class="mb-5 text-5xl font-bold">회원가입이 완료되었습니다.</h1>
                <p class="mb-5">이메일 인증이 완료되어야 로그인이 가능합니다.</p>
                <button class="btn btn-secondary">main</button>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/footer.jsp" %>
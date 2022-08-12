<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">

	<div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">
		<div class="text-center mb-[0.7rem]">
			<h1 class="text-4xl font-bold">Found Password</h1>
		</div>
		<div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
			<form:form method="post" class="card-body lg:px-[10%]">
				<div class="form-control">
					<label class="label">
						<span class="label-text">비밀번호가 이메일로 전송되었습니다.</span>
					</label>
				</div>
				<div class="form-control mt-1">
					<button type="button" class="btn btn-secondary" onclick="location.href='/login'">Login</button>
				</div>
			</form:form>
		</div>
	</div>

</section>

<%@ include file="../common/footer.jsp" %>
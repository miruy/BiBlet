<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%-- jqueryCDN --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
			integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="/css/tailwind.output.css"/>

<title>BiBlet-supervise</title>

</head>
<body>
<div class="flex flex-col justify-center bg-white px-32 py-8">
	<div class="card w-full bg-gray-50 shadow-xl p-10">

		<div class="flex flex flex-row mx-10">
			<a href="/" class="text-gray-800"><header_biblet class="normal-case text-4xl border-0 mx-[1.3rem] mt-4">BiBlet</header_biblet></a>

			<div class="tabs mx-auto">
				<div class="tab tab-bordered h-10 text-3xl tab-active">회원 관리</div>
				<div class="tab tab-bordered h-10 text-3xl">평가 관리</div>
				<div class="tab tab-bordered h-10 text-3xl">코멘트 관리</div>
				<div class="tab tab-bordered h-10 text-3xl">관리자 정보</div>
			</div>

		</div>

	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

	<script>

	</script>
</body>
</html>
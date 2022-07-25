<%@ page import="com.yurim.www.dto.AdministratorDTO" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    AdministratorDTO admAuthInfo = (AdministratorDTO) request.getSession().getAttribute("admAuthInfo");
%>
<html data-theme="purpleTheme">
<head>
    <%-- jqueryCDN --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="/css/tailwind.output.css"/>
    <link rel="stylesheet" href="/css/supervise_commentCSS.css">
    <title>BiBlet</title>
    <style type="text/css">
        a {
            color: #4b5563;
        }

        a:hover {
            color: #7e22ce;
        }

        svg {
            color: #4b5563;
        }

        svg:hover {
            color: #7e22ce;
        }

    </style>
</head>

<body class="flex flex-col min-h-screen">
<header class="navbar bg-base-100 fixed inset-x-0 top-0 z-50">

    <div class="flex flex-col justify-center bg-white mx-auto py-4 top-0 z-50">

            <div class="flex flex-row admin_font space-x-20">
                <a href="/" class="text-gray-800"><header_biblet class="normal-case text-4xl border-0 mt-4">BiBlet</header_biblet></a>

                <div id="admin_tab_group" class="tabs space-x-4" >
                    <a href="/admin/supervise_user">
                        <button id="user_tab" class="tab tab-bordered h-10 text-2xl">회원 관리</button>
                    </a>

                    <a href="/admin/supervise_appraisal">
                        <button id="star_tab" class="tab tab-bordered h-10 text-2xl">평가 관리</button>
                    </a>

                    <a href="/admin/supervise_comment">
                        <button id="comment_tab" class="tab tab-bordered h-10 text-2xl">코멘트 관리</button>
                    </a>

                    <a href="/admin/supervise_notice">
                        <button id="notice_tab" class="tab tab-bordered h-10 text-2xl">공지 관리</button>
                    </a>

                    <a href="/admin/supervise_admin">
                    <button id="admin_tab" class="tab tab-bordered h-10 text-2xl">관리자 정보</button>
                    </a>
                </div>
            </div>

    </div>

</header>
<script>

</script>
<main class="flex-1 mt-[4rem]">


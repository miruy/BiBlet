<%@ page import="com.yurim.www.dto.UserDTO" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    UserDTO authInfo = (UserDTO) request.getSession().getAttribute("authInfo");
%>
<html data-theme="purpleTheme">
<head>
    <%-- jqueryCDN --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="/css/tailwind.output.css"/>
    <link rel="stylesheet" href="/css/detailCSS.css">
    <link rel="stylesheet" href="/css/editCSS.css">
    <title>BiBlet</title>
    <style type="text/css">
        a {
            color: #4b5563;
        }

        a:hover {
            color: #7e22ce;
        }

        header_biblet{
            color: black;
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
<header class="navbar bg-base-100 fixed inset-x-0 top-0 z-50 px-8">
    <div class="navbar-start">
        <div class="flex items-center space-x-4">

            <a href="/">
                <header_biblet class="hover:text-transparent normal-case text-black border-0 mx-[1.3rem] text-2xl flex flex-row">
                    <div class="bg-clip-text bg-gradient-to-br from-pink-600 to-purple-600">B</div>
                    <div class="text-black">i</div>
                    <div class="bg-clip-text bg-gradient-to-br from-pink-600 to-purple-600">B</div>
                    <div class="text-black">let</div>
                </header_biblet>
            </a>

            <form action="/search" class="mb-0 flex items-center">
                <input type="text" name="query" id="query" value="${query}" placeholder="검색"
                       class="input border-purple-700 my-[1.2rem] h-[1.5rem]"/>
                <button class="px-[1.3rem] text-gray-800 text-xl" type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24"
                         stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                </button>
            </form>
        </div>
    </div>
    <div class="navbar-center"></div>
    <div class="navbar-end">
        <ul class="flex items-center">
            <li class="mx-[1.3rem] text-xl text-gray-800"><a href="/notice">Notice</a></li>
            <c:if test="${empty authInfo}">
                <li class="mx-[1.3rem] text-xl text-gray-800"><a href="/login">Login</a></li>
                <li class="mx-[1.3rem] text-xl text-gray-800"><a href="/signup">Sign Up</a></li>
            </c:if>
            <c:if test="${!empty authInfo}">
                <li class="mx-[1.3rem] text-xl text-gray-800"><a href="/mypage">Mypage</a></li>
                <li class="mx-[1.3rem] text-xl text-gray-800"><a href="/logout">Logout</a></li>
            </c:if>
        </ul>
    </div>
</header>
<main class="flex-1 mt-[4rem]">


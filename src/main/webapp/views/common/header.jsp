<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html data-theme="blueTheme">
    <head>
        <%-- jqueryCDN --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="/css/tailwind.output.css" />
        <title>Sign Up</title>
    </head>

    <body class="flex flex-col min-h-screen">
        <header class="navbar bg-base-100 p-0 fixed inset-x-0 top-0 z-50">
            <div class="navbar-start">
                <ul class="flex items-center">
                    <li class="mx-[1.3rem]"><a class="hover:text-[1.2rem]">Sign Up</a></li>
                    <li class="mx-[1.3rem]"><a class="hover:text-[1.2rem]">Login</a></li>
                    <li class="mx-[1.3rem]"><a class="hover:text-[1.2rem]">Notice</a></li>
                </ul>
            </div>
            <div class="navbar-center">
                <a href="#" class="normal-case text-xl border-0 hover:text-[1.5rem]">BiBlet</a>
            </div>
            <div class="navbar-end">
                <form class="mb-0 flex items-center">
                    <input type="text" placeholder="Search" class="input input-ghost my-[1.2rem] h-[1.5rem]" />
                    <button class="px-[1.3rem]">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 hover:h-6 hover:w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" /></svg>
                    </button>
                </form>
            </div>
        </header>
        <main class="flex-1 mt-[4rem]">


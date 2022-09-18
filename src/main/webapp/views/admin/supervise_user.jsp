<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../common/admin_header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white p-10">

        <div id="tab_content_group" class="px-10 py-8 my-4 w-full rounded-2xl shadow-2xl bg-gray-100 admin_font">

            <%--회원 관리--%>
            <div id="userManagement">

                <div id="selectMsg" class="text-gray-500 text-center mb-2">검색 조건 미 선택 시 '이름'으로 검색됩니다.</div>
                <form class="flex flex-row justify-center" name="requestAdmSearch" method="post"
                      action="/admin/supervise_user">

                    <select id="option" name="option" class="select select-bordered h-[3.6rem] mr-2"
                            onChange="searchStatus()">
                        <option id="default" name="default" value="default" disabled selected>선택</option>
                        <option id="userNo" name="userNo" value="userNo">회원 번호</option>
                        <option id="name" name="name" value="name">이름</option>
                        <option id="id" name="id" value="id">아이디</option>
                        <option id="email" name="email" value="email">이메일</option>
                    </select>

                    <div class="relative w-96">
                        <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                            <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                      clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input type="text" name="keyword" id="keyword" value="${keyword}"
                               class="input input-bordered text-gray-900 text-sm p-7 pl-10 w-full" placeholder="회원 검색"/>
                        <input type="submit" id="admin_search" value="검색"
                               class="text-white absolute right-2.5 bottom-2.5 top-2.5 text-sm font-medium text-gray-600 hover:text-white btn-secondary w-16 h-10 rounded-lg"></input>
                    </div>

                </form>

                <div class="my-4">

                    <div class="overflow-x-auto shadow-xl rounded-2xl">

                        <div class="flex flex-row space-x-2">
                            <div class="ml-2 mb-2">총 회원 수 :</div>
                            <div>${totalUsers}</div>
                        </div>

                        <table class="table w-full text-center">
                            <thead>
                            <tr>
                                <th>회원번호</th>
                                <th>프로필</th>
                                <th>이름</th>
                                <th>아이디</th>
                                <th>이메일</th>
                                <th>가입일자</th>
                                <th>이메일 인증 여부</th>
                                <th>강제 탈퇴</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${!empty users}">
                                <c:forEach var="user" items="${users}">
                                    <tr class="hover">
                                        <th>
                                                ${user.userNo}
                                        </th>
                                        <td>
                                            <c:if test="${user.storedPic eq null}">
                                                <div class="relative w-10 h-10 ml-2 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                                    <svg class="absolute w-12 h-12 text-gray-400 pr-2"
                                                         fill="currentColor" viewBox="0 0 20 20"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd"
                                                              d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                                              clip-rule="evenodd"></path>
                                                    </svg>
                                                </div>
                                            </c:if>
                                            <c:if test="${user.storedPic ne null}">
                                                <c:set var="idSub" value="${fn:substring(user.id,0,5)}"/>
                                                <c:if test="${idSub ne 'kakao'}">
                                                    <img src="<c:url value='/images/${user.storedPic}'/>"
                                                         class="mask mask-circle w-10 h-10 ml-2"/>
                                                </c:if>
                                                <c:if test="${idSub eq 'kakao'}">
                                                    <img src="<c:url value='http://${user.storedPic}'/>"
                                                         class="mask mask-circle w-10 h-10 ml-2"/>
                                                </c:if>
                                            </c:if>
                                        </td>
                                        <td>
                                                ${user.name}
                                        </td>
                                        <td>
                                                ${user.id}
                                        </td>
                                        <td>
                                            <c:set var="idSub" value="${fn:substring(user.id,0,5)}"/>
                                            <c:if test="${idSub ne 'kakao'}">
                                                ${user.email}
                                            </c:if>
                                            <c:if test="${idSub eq 'kakao'}">
                                                <textarea rows="1" class="w-24 bg-white resize-x"
                                                          disabled>${user.email}</textarea>
                                            </c:if>
                                        </td>
                                        <td>
                                            <fmt:parseDate value="${user.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                           var="parsedDateTime" type="both"/>
                                            <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${ parsedDateTime }"/>
                                        </td>
                                        <td>
                                            <c:if test="${user.authStatus == 1}">
                                                <span>인증</span>
                                            </c:if>
                                            <c:if test="${user.authStatus == 0}">
                                                <span>미인증</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <label for="forcedWithdraw${user.userNo}"
                                                   class="modal-button cursor-pointer">
                                                <svg class="w-8 h-8 mx-auto" style="enable-background:new 0 0 50 50;"
                                                     viewBox="0 0 50 50" xml:space="preserve"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M25,49c13.233,0,24-10.767,24-24S38.233,1,25,1S1,11.767,1,25S11.767,49,25,49z M47,25c0,5.706-2.185,10.912-5.761,14.825   L10.175,8.761C14.088,5.185,19.293,3,25,3C37.131,3,47,12.869,47,25z M8.761,10.175l31.064,31.064C35.912,44.815,30.707,47,25,47   C12.869,47,3,37.131,3,25C3,19.294,5.185,14.088,8.761,10.175z"/>
										        </svg>
                                            </label>
                                        </td>

                                    </tr>

                                    <%--강제 탈퇴 모달--%>
                                    <input type="checkbox" id="forcedWithdraw${user.userNo}" class="modal-toggle"/>
                                    <div class="modal bg-opacity-60 bg-gray-300">
                                        <div class="modal-box relative h-2/3 w-5/6 max-w-xl">

                                            <div class="text-gray-600 mb-6 text-center text-3xl font-bold">강제 탈퇴</div>

                                            <div class="flex flex-col py-20 text-center">
                                                <div class="text-xl text-black">관리자 권한으로 해당 회원을 탈퇴시키겠습니까?</div>
                                                <div class="text-gray-400">해당 회원과 관련된 모든 정보가 삭제됩니다.</div>

                                                <div class="forcedWithDrawModal flex flex-row justify-center">
                                                    <div class="modal-action">
                                                        <button type="button" id="yes" onClick="forcedWithDrawUserBtn()"
                                                                class="btn btn-secondary mr-4 hover:bg-purple-600 hover:text-white">
                                                            yes
                                                        </button>
                                                    </div>

                                                    <label for="forcedWithdraw${user.userNo}"
                                                           class="btn btn-secondary mt-6 w-[3.5rem] hover:bg-purple-600 hover:text-white">no</label>
                                                </div>

                                                <div class="forcedWithdraw form-control flex flex-row mx-auto space-x-2 my-4">
                                                    <input id="passCheck${user.userNo}" type="password" name="passCheck" placeholder="관리자 비밀번호"
                                                           class="input input-bordered text-lg text-center w-60"/>
                                                    <button type="button"
                                                            class="btn btn-secondary hover:bg-purple-600 hover:text-white w-24 bg-gray-200 border-gray-200 text-black"
                                                            onClick="adminPassCheckBtn(${user.userNo})">
                                                        비밀번호 확인
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!--모달 끝-->
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>


        </div>


    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(() => {
            $("#user_tab").addClass("tab-active");
            $("#userManagement").addClass("active")
        });

        $(document).ready(() => {
            $(".forcedWithdraw").hide();
        });



        $("#admin_tab_group > button").click((event) => {
            $("#admin_tab_group > button").removeClass("tab-active");
            $(event.target).addClass("tab-active");

            $("#tab_content_group > div").removeClass("active");

            if (event.target.id == "user_tab") {
                console.log("user_tab 선택함")
                $("#userManagement").addClass("active");
            } else if (event.target.id == "star_tab") {
                console.log("star_tab 선택함")
                $("#starManagement").addClass("active");

            } else if (event.target.id == "comment_tab") {
                console.log("comment_tab 선택함")
                $("#commentManagement").addClass("active");

            } else if (event.target.id == "notice_tab") {
                console.log("notice_tab 선택함")
                $("#noticeManagement").addClass("active");

            } else if (event.target.id == "admin_tab") {
                console.log("comment_tab 선택함")
                $("#adminManagement").addClass("active");

            }
        })

        let searchStatus = function () {
            $("#selectMsg").hide();
        }

        function forcedWithDrawUserBtn() {

            $(".forcedWithDrawModal").hide();
            $(".forcedWithdraw").show();
        }

        function adminPassCheckBtn(userNo) {

            const passCheck = $("#passCheck" + userNo).val();

            console.log(passCheck);

            $.ajax({
                url: '<c:url value="/admin/adminPassCheck"/>',
                type: 'POST',
                data: JSON.stringify({
                    "passCheck": passCheck
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function (data) {
                    if (data == 1) {
                        alert("비밀번호가 확인되었습니다.");

                        forcedWithDrawUser(userNo);

                    } else if (data == 0) {
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                }
            });
        }

        function forcedWithDrawUser(userNo) {

            $.ajax({
                url: '<c:url value="/admin/deleteUser"/>',
                type: 'POST',
                data: JSON.stringify({
                    "userNo": userNo
                }),
                dataType: "json",
                contentType: 'application/json',
                success: function (data) {
                    if (data == 1) {
                        console.log("회원 강제삭제 성공");

                        location.reload();
                    }

                }
            });

        }

    </script>
</section>

<%@ include file="../common/footer.jsp" %>
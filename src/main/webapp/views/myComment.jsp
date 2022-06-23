<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col justify-center bg-white px-32 py-8">
        <div class="card w-full bg-gray-100 shadow-xl">

            <div class="flex flex-col mb-10 px-10 py-10">
                <span class="text-2xl mr-2 mb-4">나의 코멘트</span>

                <div class="flex">
                    <div id="mypage_3" class="grid grid-cols-3 gap-3">





<%--                           <div>--%>
<%--                               <c:if test="${!empty mypage_3}">--%>
<%--                                <c:forEach var="my_3" items="${mypage_3}">--%>
<%--                                    <div class="rounded-lg bg-white w-85 h-79 flex flex-col">--%>
<%--                                        <div class="p-4 space-x-2">--%>
<%--                                            <div class="flex flex-row border-b-2 border-gray-300 my-2">--%>
<%--                                                <div id="title${my_3.isbn}"></div>--%>
<%--                                            </div>--%>
<%--                                            <textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2" rows="7"--%>
<%--                                                      id="content${my_3.appraisalNo}"--%>
<%--                                                      disabled>${my_3.comment}</textarea>--%>
<%--                                            <c:if test="${!empty my_3.startDate}">--%>
<%--                                                <div class="flex flex-row">--%>
<%--                                                    <svg enable-background="new 0 0 32 32" height="20" id="Layer_1"--%>
<%--                                                         version="1.1" viewBox="0 0 32 32" width="20" xml:space="preserve"--%>
<%--                                                         xmlns="http://www.w3.org/2000/svg"--%>
<%--                                                         xmlns:xlink="http://www.w3.org/1999/xlink">--%>
<%--                                            <g id="calendar_1_">--%>
<%--                                                <path d="M29.334,3H25V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v2h-6V1c0-0.553-0.448-1-1-1s-1,0.447-1,1v2H9V1   c0-0.553-0.448-1-1-1S7,0.447,7,1v2H2.667C1.194,3,0,4.193,0,5.666v23.667C0,30.806,1.194,32,2.667,32h26.667   C30.807,32,32,30.806,32,29.333V5.666C32,4.193,30.807,3,29.334,3z M30,29.333C30,29.701,29.701,30,29.334,30H2.667   C2.299,30,2,29.701,2,29.333V5.666C2,5.299,2.299,5,2.667,5H7v2c0,0.553,0.448,1,1,1s1-0.447,1-1V5h6v2c0,0.553,0.448,1,1,1   s1-0.447,1-1V5h6v2c0,0.553,0.447,1,1,1s1-0.447,1-1V5h4.334C29.701,5,30,5.299,30,5.666V29.333z"--%>
<%--                                                      fill="#333332"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="7" y="12"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="7" y="17"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="7" y="22"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="14" y="22"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="14" y="17"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="14" y="12"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="21" y="22"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="21" y="17"/>--%>
<%--                                                <rect fill="#333332" height="3" width="4" x="21" y="12"/>--%>
<%--                                            </g>--%>
<%--                                        </svg>--%>
<%--                                                    <div class="ml-2 pr-2 text-gray-600" id="startDate${my_3.appraisalNo}">--%>
<%--                                                            ${my_3.startDate}--%>
<%--                                                    </div>--%>
<%--                                                    ~--%>
<%--                                                    <div class="ml-3 text-gray-600" id="endDate${my_3.appraisalNo}">--%>
<%--                                                            ${my_3.endDate}--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </c:if>--%>
<%--                                            <div class="flex flex-row pt-1">--%>
<%--                                                <svg id="Layer_1" class="mr-2" width="22" height="22" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M24,46C11.9,46,2,36.1,2,24S11.9,2,24,2s22,9.9,22,22S36.1,46,24,46z M24,4C13,4,4,13,4,24c0,11,9,20,20,20   c11,0,20-9,20-20C44,13,35,4,24,4z"/></g><g><polygon points="20,34.1 11.3,25.4 12.7,23.9 20,31.2 35.3,15.9 36.7,17.4  "/></g></svg>--%>
<%--                                                    ${my_3.coPrv}--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </c:forEach>--%>
<%--                               </c:if>--%>
<%--                           </div>--%>




                    </div>

                    </div>
                </div>

            </div>

        </div>
    </div>

        <script src="https://code.jquery.com/jquery-3.6.0.js"
                integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                // 나의 코멘트
                <c:if test="${!empty mypage_3}">
                    <c:forEach var="my_3" items="${mypage_3}">
                        mypage_3("${my_3.isbn}", "${my_3.startDate}", "${my_3.comment}", "${my_3.endDate}", "${my_3.coPrv}")
                    </c:forEach>
                </c:if>
            })


            // 읽고싶어요 전체
            function mypage_3(isbn, startDate, comment, endDate, coPrv) {
                console.log("[" + isbn);
                console.log(startDate);
                console.log(comment);
                console.log(endDate);
                console.log(coPrv + "]");


                $.ajax({	//카카오 검색요청 / [요청]
                    method: "GET",
                    traditional: true,
                    async: false,	//앞의 요청의 대한 응답이 올 때 까지 기다리기(false: 순서대로, true: 코드 중에 실행)
                    url: "https://dapi.kakao.com/v3/search/book?target=isbn",
                    data: {query: isbn},
                    headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
                })
                .done(function (msg) {	//검색 결과 담기 / [응답]
                    let title = msg.documents[0].title;
                    let subTitle = '';
                    console.log(subTitle);
                    subTitle = title.substring(0, 14);

                    let html = '';

                    html += '<div class="card px-2 bg-gray-100">';
                        html += '<div class="rounded-lg bg-white w-96 h-79 flex flex-col">';
                            html += '<div class="p-4">';
                                html += '<div class="flex flex-row border-b-2 border-gray-300 my-2 pl-12 pr-10">'
                                    if(title.length >= 15) {
                                        html += '<a href="/read/' + isbn + '">' + subTitle + '...</a>';
                                    }else if(title.length < 15) {
                                        html += '<a href="/read/' + isbn + '">' + title + '...</a>';
                                    }
                                html += '</div>';
                                html += '<textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2 px-2" rows="7" disabled>' + comment + '</textarea>';
                                if(startDate != null) {
                                html += '<div class="flex flex-row ml-2">';
                                    html += '<svg enable-background="new 0 0 32 32" height="20" id="Layer_1" version="1.1" viewBox="0 0 32 32" width="20" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">';
                                        html += '<g id="calendar_1_">';
                                            html += '<path d="M29.334,3H25V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v2h-6V1c0-0.553-0.448-1-1-1s-1,0.447-1,1v2H9V1   c0-0.553-0.448-1-1-1S7,0.447,7,1v2H2.667C1.194,3,0,4.193,0,5.666v23.667C0,30.806,1.194,32,2.667,32h26.667   C30.807,32,32,30.806,32,29.333V5.666C32,4.193,30.807,3,29.334,3z M30,29.333C30,29.701,29.701,30,29.334,30H2.667   C2.299,30,2,29.701,2,29.333V5.666C2,5.299,2.299,5,2.667,5H7v2c0,0.553,0.448,1,1,1s1-0.447,1-1V5h6v2c0,0.553,0.448,1,1,1   s1-0.447,1-1V5h6v2c0,0.553,0.447,1,1,1s1-0.447,1-1V5h4.334C29.701,5,30,5.299,30,5.666V29.333z" fill="#333332"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="7" y="12"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="7" y="17"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="7" y="22"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="14" y="22"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="14" y="17"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="14" y="12"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="21" y="22"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="21" y="17"/>';
                                            html += '<rect fill="#333332" height="3" width="4" x="21" y="12"/>';
                                        html += '</g>';
                                    html += '</svg>';
                                    html += '<div class="ml-2 pr-2 text-gray-600">' + startDate + '</div>~';
                                    html += '<div class="ml-3 text-gray-600">' + endDate + '</div>';
                                html += '</div>';
                                }
                                html += '<div class="flex flex-row pt-1 ml-2">';
                                    html += '<svg id="Layer_1" class="mr-2" width="22" height="22" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M24,46C11.9,46,2,36.1,2,24S11.9,2,24,2s22,9.9,22,22S36.1,46,24,46z M24,4C13,4,4,13,4,24c0,11,9,20,20,20   c11,0,20-9,20-20C44,13,35,4,24,4z"/></g><g><polygon points="20,34.1 11.3,25.4 12.7,23.9 20,31.2 35.3,15.9 36.7,17.4  "/></g></svg>' + coPrv;
                                html += '</div>';
                            html += '</div>';
                        html += '</div>';
                    html += '</div>';

                    $("#mypage_3").append(html);

                });

            }

        </script>
</section>

<%@ include file="common/footer.jsp" %>

<%--let title = msg.documents[0].title;--%>
<%--let subTitle = '';--%>


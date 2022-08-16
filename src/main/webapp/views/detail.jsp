<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="common/header.jsp" %>

<section>

    <div class="bg-white justify-center items-center ml-32 px-24 py-20">

        <div class="flex flex-col xl:flex-row">

            <div id="bookThumbnail" class="flex-grow-1 w-60"></div>
            <div class="flex flex-col ml-4">

                <div id="bookTitle" class="flex flex-col mt-6"></div>
                <div class="flex flex-col">
                    <div id="bookAuthor" class="text-gray-500 flex-row mt-2"></div>
                    <div class="text-l mt-2">
                        <c:if test="${starAVG ne 0}">
                            평균 ★ ${starAVG} (${starCount}명)
                        </c:if>
                        <c:if test="${starAVG eq 0}">
                            평균 ★ ${starAVG} (0명)
                        </c:if>
                    </div>
                </div>

                <div class="flex flex-row mt-24 space-x-16">

                    <%--비로그인 시 선택 불가능--%>
                    <c:if test="${empty authInfo}">
                        <div class="flex flex-col items-center justify-center">
                            <span id="starMsgUL" class="text-gray-600 mb-2">평가하기</span>
                            <div class="star-group flex text-5xl flex-row-reverse">
                                <input type="radio" id="star-1" class="hidden" onclick="alert('로그인 후 이용가능합니다.')"
                                       onmouseover="mouseOverUL('최고예요!')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-1"
                                       class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseover="mouseOverUL('최고예요!')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-2" class="hidden" onmouseover="mouseOverUL('재미있어요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-2"
                                       class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('재미있어요')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-3" class="hidden" onmouseover="mouseOverUL('보통이에요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-3"
                                       class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('보통이에요')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-4" class="hidden" onmouseover="mouseOverUL('재미없어요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-4"
                                       class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('재미없어요')"
                                       onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-5" class="hidden" onmouseover="mouseOverUL('싫어요')"
                                       onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-5"
                                       class="s5 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverUL('싫어요')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽고싶어요</span>
                            <div class="cursor-pointer mt-2" onclick="alert('로그인 후 이용가능합니다.')">
                                <svg class="mx-auto" id="Layer_1" width="30" height="30" style="enable-background:new 0 0 48 48;"
                                     version="1.1" viewBox="0 0 48 48" xml:space="preserve"
                                     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                    <path d="M24,26c6.6,0,12-5.4,12-12S30.6,2,24,2c-6.6,0-12,5.4-12,12S17.4,26,24,26z M24,4c5.5,0,10,4.5,10,10s-4.5,10-10,10   c-5.5,0-10-4.5-10-10S18.5,4,24,4z"/>
                                    <path d="M33,28H15C7.8,28,2,33.8,2,41v5h2v-5c0-6.1,4.9-11,11-11h18V28z"/>
                                    <polygon
                                            points="46,38 40,38 40,32 38,32 38,38 32,38 32,40 38,40 38,46 40,46 40,40 46,40  "/>
                                </g></svg>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">코멘트</span>
                            <div class="cursor-pointer mt-2" onclick="alert('로그인 후 이용가능합니다.')">
                                <svg class="mx-auto" id="Layer_1" width="30" height="30" style="enable-background:new 0 0 48 48;"
                                     version="1.1" viewBox="0 0 48 48" xml:space="preserve"
                                     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                    <g>
                                        <path d="M20.8,27.2l2.1-6.3L38,5.8l4.2,4.2L27.1,25.1L20.8,27.2z M24.7,21.9L24,24l2.1-0.7L39.4,10L38,8.6L24.7,21.9z"/>
                                    </g>
                                    <g>
                                        <path d="M42.9,9.3l-4.2-4.2l1.4-1.4c1.2-1.2,3-1.2,4.2,0c0.6,0.6,0.9,1.3,0.9,2.1c0,0.8-0.3,1.5-0.9,2.1L42.9,9.3z M41.5,5.1    l1.4,1.4c0.2-0.2,0.3-0.4,0.3-0.7c0-0.3-0.1-0.5-0.3-0.7C42.5,4.7,41.9,4.7,41.5,5.1z"/>
                                    </g>
                                </g>
                                    <g>
                                        <path d="M38,46H5c-1.7,0-3-1.3-3-3V10c0-1.7,1.3-3,3-3h27v2H5c-0.6,0-1,0.4-1,1v33c0,0.6,0.4,1,1,1h33c0.6,0,1-0.4,1-1V16h2v27   C41,44.7,39.7,46,38,46z"/>
                                    </g></svg>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽는중</span>
                            <div class="cursor-pointer mt-2" onclick="alert('로그인 후 이용가능합니다.')">
                                <svg enable-background="new 0 0 48 48" class="mx-auto" width="30" height="30" version="1.1" viewBox="0 0 48 48"
                                     xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink"><g id="Expanded">
                                    <g>
                                        <g>
                                            <path d="M23,48.049c-0.147,0-0.294-0.032-0.43-0.097l-21-10C1.222,37.786,1,37.435,1,37.049v-31c0-0.343,0.176-0.662,0.466-0.846     C1.755,5.02,2.12,4.999,2.43,5.146L23,14.941l20.57-9.796c0.31-0.146,0.673-0.126,0.963,0.058C44.824,5.387,45,5.706,45,6.049v31     c0,0.386-0.222,0.737-0.57,0.903l-21,10C23.294,48.017,23.147,48.049,23,48.049z M3,36.417l20,9.524l20-9.524V7.633l-19.57,9.319     c-0.271,0.129-0.588,0.129-0.859,0L3,7.633V36.417z"/>
                                        </g>
                                        <g>
                                            <path d="M23,12.204L5.567,3.903C5.068,3.665,4.857,3.068,5.094,2.57c0.238-0.499,0.834-0.708,1.333-0.474L23,9.989l16.573-7.893     c0.5-0.234,1.095-0.025,1.333,0.474c0.237,0.498,0.026,1.095-0.473,1.333L23,12.204z"/>
                                        </g>
                                        <g>
                                            <rect height="31" width="2" x="22" y="16.049"/>
                                        </g>
                                    </g>
                                </g></svg>
                            </div>
                        </div>
                    </c:if>

                    <%--로그인 시 선택 가능--%>
                    <c:if test="${!empty authInfo}">
                        <div class="flex flex-col items-center justify-center">
                                <%--                            <c:if test="${empty userStarMsg}">--%>
                            <span id="starMsgL" class="text-gray-600"></span>
                                <%--                            </c:if>--%>
                            <span id="userStarMsg" class="text-gray-600">${userStarMsg}</span>
                            <div class="star-group flex text-5xl flex-row-reverse mt-2">
                                <input type="radio" id="star1" value=5 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 5}">checked="checked"</c:if> />
                                <label for="star1"
                                       class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star2" value=4 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 4}">checked="checked"</c:if> />
                                <label for="star2"
                                       class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star3" value=3 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 3}">checked="checked"</c:if> />
                                <label for="star3"
                                       class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star4" value=2 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 2}">checked="checked"</c:if> />
                                <label for="star4"
                                       class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star5" value=1 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 1}">checked="checked"</c:if> />
                                <label for="star5"
                                       class="s5 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽고싶어요</span>
                            <label class="swap mt-2">
                                <input name="want" type="checkbox"
                                       <c:if test="${userStatus == 0}">checked="checked"</c:if>/>
                                <div class="swap-on" onclick="insertStatus(0)">
                                    <svg class="mx-auto" id="Layer_1" width="30" height="30" style="enable-background:new 0 0 48 48;"
                                         version="1.1" viewBox="0 0 48 48" xml:space="preserve"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                        <path d="M24,26c-6.6,0-12-5.4-12-12S17.4,2,24,2c6.6,0,12,5.4,12,12S30.6,26,24,26z M24,4c-5.5,0-10,4.5-10,10s4.5,10,10,10   c5.5,0,10-4.5,10-10S29.5,4,24,4z"/>
                                    </g>
                                        <g>
                                            <path d="M4,46H2v-5c0-7.2,5.8-13,13-13h18v2H15C8.9,30,4,34.9,4,41V46z"/>
                                        </g>
                                        <g>
                                            <path d="M38,46.3l-6.7-6.6c-1.8-2.2-1.7-5.3,0.2-7.2c0.9-0.9,2.3-1.5,3.7-1.5c1,0,2,0.3,2.8,0.8c2.1-1.3,4.8-1,6.5,0.7l0,0l0,0   c0.9,0.9,1.5,2.3,1.5,3.6c0,1.3-0.4,2.5-1.2,3.5L38,46.3z M35.2,33c-0.9,0-1.7,0.3-2.3,0.9c-1.2,1.2-1.2,3.1-0.1,4.5l0.1,0.1l5.1,5   l5.3-5.3c0.6-0.7,0.7-1.5,0.7-2.1c0-0.8-0.3-1.6-0.9-2.2l0,0c-1.2-1.2-3.1-1.2-4.5-0.1L38,34.3l-0.6-0.6C36.6,33.1,35.8,33,35.2,33   z"/>
                                        </g></svg>
                                </div>
                                <div class="swap-off " onclick="deleteStatus(0)">
                                    <svg class="mx-auto" id="Layer_1" width="30" height="30" style="enable-background:new 0 0 48 48;"
                                         version="1.1" viewBox="0 0 48 48" xml:space="preserve"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                        <path d="M24,26c6.6,0,12-5.4,12-12S30.6,2,24,2c-6.6,0-12,5.4-12,12S17.4,26,24,26z M24,4c5.5,0,10,4.5,10,10s-4.5,10-10,10   c-5.5,0-10-4.5-10-10S18.5,4,24,4z"/>
                                        <path d="M33,28H15C7.8,28,2,33.8,2,41v5h2v-5c0-6.1,4.9-11,11-11h18V28z"/>
                                        <polygon
                                                points="46,38 40,38 40,32 38,32 38,38 32,38 32,40 38,40 38,46 40,46 40,40 46,40  "/>
                                    </g></svg>
                                </div>
                            </label>
                        </div>

                        <c:if test="${!empty userStatusNo}">
                            <div class="flex flex-col">
                                <span class="text-gray-600 mb-2">코멘트</span>
                                <div class="dropdown">
                                    <div tabindex="0">
                                        <svg class="mx-auto" id="Layer_1" width="30" height="30"
                                             style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48"
                                             xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                             xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                            <g>
                                                <path d="M20.8,27.2l2.1-6.3L38,5.8l4.2,4.2L27.1,25.1L20.8,27.2z M24.7,21.9L24,24l2.1-0.7L39.4,10L38,8.6L24.7,21.9z"/>
                                            </g>
                                            <g>
                                                <path d="M42.9,9.3l-4.2-4.2l1.4-1.4c1.2-1.2,3-1.2,4.2,0c0.6,0.6,0.9,1.3,0.9,2.1c0,0.8-0.3,1.5-0.9,2.1L42.9,9.3z M41.5,5.1    l1.4,1.4c0.2-0.2,0.3-0.4,0.3-0.7c0-0.3-0.1-0.5-0.3-0.7C42.5,4.7,41.9,4.7,41.5,5.1z"/>
                                            </g>
                                        </g>
                                            <g>
                                                <path d="M38,46H5c-1.7,0-3-1.3-3-3V10c0-1.7,1.3-3,3-3h27v2H5c-0.6,0-1,0.4-1,1v33c0,0.6,0.4,1,1,1h33c0.6,0,1-0.4,1-1V16h2v27   C41,44.7,39.7,46,38,46z"/>
                                            </g></svg>
                                    </div>
                                    <ul tabindex="0"
                                        class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-36">
                                        <li><label for="modifyComment"
                                                   class="text-gray-600 hover:text-white justify-center items-center">코멘트
                                            수정</label></li>
                                        <li><a class="text-gray-600 hover:text-white justify-center items-center"
                                               onclick="deleteComment()">코멘트 삭제</a></li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty userStatusNo}">
                            <div class="flex flex-col">
                                <span class="text-gray-600 mb-2">코멘트</span>
                                <label for="my-modal-3" class="modal-button cursor-pointer">
                                    <svg class="mx-auto" id="Layer_1" width="30" height="30" style="enable-background:new 0 0 48 48;"
                                         version="1.1" viewBox="0 0 48 48" xml:space="preserve"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                        <g>
                                            <path d="M20.8,27.2l2.1-6.3L38,5.8l4.2,4.2L27.1,25.1L20.8,27.2z M24.7,21.9L24,24l2.1-0.7L39.4,10L38,8.6L24.7,21.9z"/>
                                        </g>
                                        <g>
                                            <path d="M42.9,9.3l-4.2-4.2l1.4-1.4c1.2-1.2,3-1.2,4.2,0c0.6,0.6,0.9,1.3,0.9,2.1c0,0.8-0.3,1.5-0.9,2.1L42.9,9.3z M41.5,5.1    l1.4,1.4c0.2-0.2,0.3-0.4,0.3-0.7c0-0.3-0.1-0.5-0.3-0.7C42.5,4.7,41.9,4.7,41.5,5.1z"/>
                                        </g>
                                    </g>
                                        <g>
                                            <path d="M38,46H5c-1.7,0-3-1.3-3-3V10c0-1.7,1.3-3,3-3h27v2H5c-0.6,0-1,0.4-1,1v33c0,0.6,0.4,1,1,1h33c0.6,0,1-0.4,1-1V16h2v27   C41,44.7,39.7,46,38,46z"/>
                                        </g></svg>
                                </label>
                            </div>
                        </c:if>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽는중</span>
                            <label class="swap mt-2">
                                <input name="read" type="checkbox"
                                       <c:if test="${userStatus == 1}">checked="checked"</c:if>/>
                                <div class="swap-on" onclick="insertStatus(1)">
                                    <svg class="mx-auto" id="Layer_1" width="30" height="30" style="enable-background:new 0 0 48 48;"
                                         version="1.1" viewBox="0 0 48 48" xml:space="preserve"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                        <path d="M38,46.9l-14-9.7l-14,9.7V5c0-1.7,1.3-3,3-3h22c1.7,0,3,1.3,3,3V46.9z M24,34.8l12,8.3V5c0-0.6-0.4-1-1-1H13   c-0.6,0-1,0.4-1,1v38.1L24,34.8z"/>
                                    </g></svg>
                                </div>
                                <div class="swap-off" onclick="deleteStatus(1)">
                                    <svg enable-background="new 0 0 48 48" class="mx-auto" width="30" height="30" version="1.1" viewBox="0 0 48 48"
                                         xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink"><g id="Expanded">
                                        <g>
                                            <g>
                                                <path d="M23,48.049c-0.147,0-0.294-0.032-0.43-0.097l-21-10C1.222,37.786,1,37.435,1,37.049v-31c0-0.343,0.176-0.662,0.466-0.846     C1.755,5.02,2.12,4.999,2.43,5.146L23,14.941l20.57-9.796c0.31-0.146,0.673-0.126,0.963,0.058C44.824,5.387,45,5.706,45,6.049v31     c0,0.386-0.222,0.737-0.57,0.903l-21,10C23.294,48.017,23.147,48.049,23,48.049z M3,36.417l20,9.524l20-9.524V7.633l-19.57,9.319     c-0.271,0.129-0.588,0.129-0.859,0L3,7.633V36.417z"/>
                                            </g>
                                            <g>
                                                <path d="M23,12.204L5.567,3.903C5.068,3.665,4.857,3.068,5.094,2.57c0.238-0.499,0.834-0.708,1.333-0.474L23,9.989l16.573-7.893     c0.5-0.234,1.095-0.025,1.333,0.474c0.237,0.498,0.026,1.095-0.473,1.333L23,12.204z"/>
                                            </g>
                                            <g>
                                                <rect height="31" width="2" x="22" y="16.049"/>
                                            </g>
                                        </g>
                                    </g></svg>
                                </div>
                            </label>
                        </div>
                    </c:if>
                </div>
            </div>

        </div>

    </div>

    <%--코멘트 작성 폼--%>
    <input type="checkbox" id="my-modal-3" class="modal-toggle"/>
    <div class="modal bg-opacity-60 bg-gray-300">
        <div class="modal-box relative space-y-2 h-4/5 w-11/12 max-w-3xl">
            <form:form modelAttribute="requestWriteComment">
                <label for="my-modal-3"
                       class="btn btn-secondary btn-sm btn-circle absolute right-2 top-2 text-gray-600 hover:text-white">✕</label>
                <div id="title" class="text-gray-600 mb-3 text-center"></div>
                <textarea class="content w-full text-gray-600" rows="15" id="comment" name="comment"
                          placeholder="- 이 작품의 대한 생각을 자유롭게 표현해주세요. &#13;&#10;- enter 없이 작성해주세요."></textarea>
                <div class="ml-56 mt-2">
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 독서 시작 날짜 : </span>
                        <div>
                            <input type="date" id="startDate" name="startDate" class="text-gray-400"/>
                        </div>
                    </div>
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 독서 완료 날짜 : </span>
                        <div>
                            <input type="date" id="endDate" name="endDate" class="text-gray-400"/>
                        </div>
                    </div>
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 공개 여부 :</span>
                        <span>공개 </span>
                        <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvY"
                               name="coPrv"
                               value="공개" onclick='checkOnlyOne(this)'/>
                        <span>비공개 </span>
                        <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvN"
                               name="coPrv"
                               value="비공개"
                               onclick='checkOnlyOne(this)'/>
                    </div>
                </div>
                <div class="modal-action justify-center items-center">
                    <input type="submit" id="submit1" onsubmit="return false" for="my-modal-3"
                           class="btn btn-secondary text-gray-600 hover:text-white"
                           value="저장"/>
                </div>
            </form:form>
        </div>
    </div>

    <%--코멘트 수정 폼--%>
    <input type="checkbox" id="modifyComment" class="modal-toggle"/>
    <c:forEach var="myComment" items="${myComment}">
        <div class="modal bg-opacity-60 bg-gray-300">
            <div class="modal-box relative space-y-2 h-4/5 w-11/12 max-w-3xl">
                <label for="modifyComment"
                       class="btn btn-secondary btn-sm btn-circle absolute right-2 top-2 text-gray-600 hover:text-white">✕</label>
                <textarea class="content w-full p-8 text-gray-600 mt-6" rows="15" id="comment_m" name="comment"
                          placeholder="${myComment.comment}"></textarea>
                <div class="ml-56 mt-2">
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 독서 시작 날짜 : </span>
                        <div>
                            <input type="date" id="startDate_m" name="startDate" class="text-gray-400"/>
                        </div>
                    </div>
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 독서 완료 날짜 : </span>
                        <div>
                            <input type="date" id="endDate_m" name="endDate" class="text-gray-400"/>
                        </div>
                    </div>
                    <div class="flex flex-row text-gray-600 space-x-2">
                        <span> 공개 여부 :</span>
                        <span>공개 </span>
                        <input class="coPrvM checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvY_m"
                               name="coPrv"
                               value="공개" onclick='checkOnlyOne(this)'/>
                        <span>비공개 </span>
                        <input class="coPrvM checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrvN_m"
                               name="coPrv"
                               value="비공개"
                               onclick='checkOnlyOne(this)'/>
                    </div>
                </div>
                <div class="modal-action justify-center items-center">
                    <button id="submit2" class="btn btn-secondary text-gray-600 hover:text-white">저장</button>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="bg-gray-100 px-48 pb-20 pt-10">


        <div id="writeCommentBtn" class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4"></div>

        <c:forEach var="myC" items="${myComment}">
            <div class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4">
                <div id="myComment_1" class="hidden">
                    <div class="flex flex-row justify-center items-center text-center space-x-4">
                        <c:if test="${myC.storedPic eq null}">
                            <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                <svg class="absolute w-12 h-12 text-gray-400 pr-2" fill="currentColor"
                                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${myC.storedPic ne null}">
                            <img src="<c:url value='http://${myC.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
                        </c:if>
                        <span class="text-gray-600 text-sm">${myC.name}</span>
                        <c:if test="${myC.active == 0}">
                            <textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2">해당 코멘트는 권리자 권한으로 표시가 중지되었습니다.</textarea>
                        </c:if>
                        <c:if test="${myC.active == 1}">
                            <textarea class="my-[1.2rem] text-gray-600 resize-none w-64 bg-white" rows="1"
                                      disabled>${myC.comment}</textarea>
                        </c:if>
                        <label class="flex flex-row">
                            <label for="modifyComment" class="text-gray-400 hover:text-black pr-2">
                                <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1"
                                     viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                    <path d="M24,2C17.6,1.9,11.7,4.2,7.6,8.2C3.9,11.9,2,16.6,2,22c0,11.6,9.3,20,22,20c1.8,0,3.3-0.1,4.6-0.4L42,46.4V33.8   c2.6-3.4,4-7.5,4-11.8C46,10.4,36.7,2,24,2z M40.2,32.9L40,33.2v10.4l-11.2-4l-0.3,0.1C27.2,39.9,25.8,40,24,40   C12.4,40,4,32.4,4,22c0-4.8,1.7-9.1,5-12.4C12.7,6,18.1,4,24,4c11.6,0,20,7.6,20,18C44,26,42.7,29.8,40.2,32.9z"/>
                                    <path d="M24,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S26.2,18,24,18z M24,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S25.1,24,24,24z"/>
                                    <path d="M13,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S15.2,18,13,18z M13,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S14.1,24,13,24z"/>
                                    <path d="M35,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S37.2,18,35,18z M35,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S36.1,24,35,24z"/>
                                </g></svg>
                                <span>수정</span>
                            </label>
                        </label>
                        <div class="text-gray-400 hover:text-black" onclick="deleteComment()">
                            <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                <path d="M27,5c0-1.7-1.3-3-3-3s-3,1.3-3,3H5v2h38V5H27z M24,4c0.6,0,1,0.4,1,1h-2C23,4.4,23.4,4,24,4z"/>
                                <rect height="28" width="2" x="16" y="12"/>
                                <rect height="28" width="2" x="30" y="12"/>
                                <rect height="28" width="2" x="23" y="12"/>
                                <path d="M37,43c0,0.6-0.4,1-1,1H12c-0.6,0-1-0.4-1-1V9H9v34c0,1.7,1.3,3,3,3h24c1.7,0,3-1.3,3-3V9h-2V43z"/>
                            </g></svg>
                            <span>삭제</span>
                        </div>
                    </div>
                </div>

                <div id="myComment_2" class="hidden">
                    <div class="flex flex-row justify-center items-center text-center space-x-4">
                        <c:if test="${myC.storedPic eq null}">
                            <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                <svg class="absolute w-12 h-12 text-gray-400 pr-2" fill="currentColor"
                                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${myC.storedPic ne null}">
                            <img src="<c:url value='http://${myC.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
                        </c:if>
                        <span class="text-gray-600 text-sm">${myC.name}</span>
                        <c:if test="${myC.active == 0}">
                            <textarea class="text-gray-800 box-content bg-white w-64 resize-none mt-2">해당 코멘트는 권리자 권한으로 표시가 중지되었습니다.</textarea>
                        </c:if>
                        <c:if test="${myC.active == 1}">
                            <textarea class="my-[1.2rem] text-gray-600 resize-none w-64 bg-white" rows="1"
                                      disabled>${myC.comment}</textarea>
                        </c:if>
                        <div class="flex flex-row space-x-4">
                            <div class="flex flex-col">
                                <div class="text-gray-400 text-xs">독서시작날짜</div>
                                <div class="text-gray-600">${myC.startDate}</div>
                            </div>
                            <div class="flex flex-col pr-2">
                                <div class="text-gray-400 text-xs">독서완료날짜</div>
                                <div class="text-gray-600">${myC.endDate}</div>
                            </div>
                        </div>
                        <label class="flex flex-row">
                            <label for="modifyComment" class="text-gray-400 hover:text-black pr-2">
                                <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1"
                                     viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                    <path d="M24,2C17.6,1.9,11.7,4.2,7.6,8.2C3.9,11.9,2,16.6,2,22c0,11.6,9.3,20,22,20c1.8,0,3.3-0.1,4.6-0.4L42,46.4V33.8   c2.6-3.4,4-7.5,4-11.8C46,10.4,36.7,2,24,2z M40.2,32.9L40,33.2v10.4l-11.2-4l-0.3,0.1C27.2,39.9,25.8,40,24,40   C12.4,40,4,32.4,4,22c0-4.8,1.7-9.1,5-12.4C12.7,6,18.1,4,24,4c11.6,0,20,7.6,20,18C44,26,42.7,29.8,40.2,32.9z"/>
                                    <path d="M24,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S26.2,18,24,18z M24,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S25.1,24,24,24z"/>
                                    <path d="M13,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S15.2,18,13,18z M13,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S14.1,24,13,24z"/>
                                    <path d="M35,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S37.2,18,35,18z M35,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S36.1,24,35,24z"/>
                                </g></svg>
                                <span>수정</span>
                            </label>
                        </label>
                        <div class="text-gray-400 hover:text-black" onclick="deleteComment()">
                            <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                <path d="M27,5c0-1.7-1.3-3-3-3s-3,1.3-3,3H5v2h38V5H27z M24,4c0.6,0,1,0.4,1,1h-2C23,4.4,23.4,4,24,4z"/>
                                <rect height="28" width="2" x="16" y="12"/>
                                <rect height="28" width="2" x="30" y="12"/>
                                <rect height="28" width="2" x="23" y="12"/>
                                <path d="M37,43c0,0.6-0.4,1-1,1H12c-0.6,0-1-0.4-1-1V9H9v34c0,1.7,1.3,3,3,3h24c1.7,0,3-1.3,3-3V9h-2V43z"/>
                            </g></svg>
                            <span>삭제</span>
                        </div>
                    </div>
                </div>


                <div id="myComment_3" class="hidden">
                    <div class="flex flex-row justify-center items-center text-center space-x-4">
                        <c:if test="${myC.storedPic eq null}">
                            <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                <svg class="absolute w-12 h-12 text-gray-400 pr-2" fill="currentColor"
                                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${myC.storedPic ne null}">
                            <img src="<c:url value='/images/${myC.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
                        </c:if>
                        <span class="text-gray-600 text-sm">${myC.id}</span>
                        <textarea class="my-[1.2rem] text-gray-600 resize-none w-64 bg-white" rows="1"
                                  disabled>${myC.comment}</textarea>
                        <label class="flex flex-row">
                            <label for="modifyComment" class="text-gray-400 hover:text-black pr-2">
                                <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1"
                                     viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                    <path d="M24,2C17.6,1.9,11.7,4.2,7.6,8.2C3.9,11.9,2,16.6,2,22c0,11.6,9.3,20,22,20c1.8,0,3.3-0.1,4.6-0.4L42,46.4V33.8   c2.6-3.4,4-7.5,4-11.8C46,10.4,36.7,2,24,2z M40.2,32.9L40,33.2v10.4l-11.2-4l-0.3,0.1C27.2,39.9,25.8,40,24,40   C12.4,40,4,32.4,4,22c0-4.8,1.7-9.1,5-12.4C12.7,6,18.1,4,24,4c11.6,0,20,7.6,20,18C44,26,42.7,29.8,40.2,32.9z"/>
                                    <path d="M24,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S26.2,18,24,18z M24,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S25.1,24,24,24z"/>
                                    <path d="M13,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S15.2,18,13,18z M13,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S14.1,24,13,24z"/>
                                    <path d="M35,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S37.2,18,35,18z M35,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S36.1,24,35,24z"/>
                                </g></svg>
                                <span>수정</span>
                            </label>
                        </label>
                        <div class="text-gray-400 hover:text-black" onclick="deleteComment()">
                            <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                <path d="M27,5c0-1.7-1.3-3-3-3s-3,1.3-3,3H5v2h38V5H27z M24,4c0.6,0,1,0.4,1,1h-2C23,4.4,23.4,4,24,4z"/>
                                <rect height="28" width="2" x="16" y="12"/>
                                <rect height="28" width="2" x="30" y="12"/>
                                <rect height="28" width="2" x="23" y="12"/>
                                <path d="M37,43c0,0.6-0.4,1-1,1H12c-0.6,0-1-0.4-1-1V9H9v34c0,1.7,1.3,3,3,3h24c1.7,0,3-1.3,3-3V9h-2V43z"/>
                            </g></svg>
                            <span>삭제</span>
                        </div>
                    </div>
                </div>


                <div id="myComment_4" class="hidden">
                    <div class="flex flex-row justify-center items-center text-center space-x-4">
                        <c:if test="${myC.storedPic eq null}">
                            <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                <svg class="absolute w-12 h-12 text-gray-400 pr-2" fill="currentColor"
                                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </div>
                        </c:if>
                        <c:if test="${myC.storedPic ne null}">
                            <img src="<c:url value='/images/${myC.storedPic}'/>" class="mask mask-circle w-10 h-10"/>
                        </c:if>
                        <span class="text-gray-600 text-sm">${myC.id}</span>
                        <textarea class="my-[1.2rem] text-gray-600 resize-none w-64 bg-white" rows="1"
                                  disabled>${myC.comment}</textarea>
                        <div class="flex flex-row space-x-4">
                            <div class="flex flex-col">
                                <div class="text-gray-400 text-xs">독서시작날짜</div>
                                <div class="text-gray-600">${myC.startDate}</div>
                            </div>
                            <div class="flex flex-col pr-2">
                                <div class="text-gray-400 text-xs">독서완료날짜</div>
                                <div class="text-gray-600">${myC.endDate}</div>
                            </div>
                        </div>
                        <label class="flex flex-row">
                            <label for="modifyComment" class="text-gray-400 hover:text-black pr-2">
                                <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1"
                                     viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                    <path d="M24,2C17.6,1.9,11.7,4.2,7.6,8.2C3.9,11.9,2,16.6,2,22c0,11.6,9.3,20,22,20c1.8,0,3.3-0.1,4.6-0.4L42,46.4V33.8   c2.6-3.4,4-7.5,4-11.8C46,10.4,36.7,2,24,2z M40.2,32.9L40,33.2v10.4l-11.2-4l-0.3,0.1C27.2,39.9,25.8,40,24,40   C12.4,40,4,32.4,4,22c0-4.8,1.7-9.1,5-12.4C12.7,6,18.1,4,24,4c11.6,0,20,7.6,20,18C44,26,42.7,29.8,40.2,32.9z"/>
                                    <path d="M24,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S26.2,18,24,18z M24,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S25.1,24,24,24z"/>
                                    <path d="M13,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S15.2,18,13,18z M13,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S14.1,24,13,24z"/>
                                    <path d="M35,18c-2.2,0-4,1.8-4,4s1.8,4,4,4s4-1.8,4-4S37.2,18,35,18z M35,24c-1.1,0-2-0.9-2-2s0.9-2,2-2s2,0.9,2,2S36.1,24,35,24z"/>
                                </g></svg>
                                <span>수정</span>
                            </label>
                        </label>
                        <div class="text-gray-400 hover:text-black" onclick="deleteComment()">
                            <svg id="Layer_1" style="enable-background:new 0 0 48 48;" version="1.1" viewBox="0 0 48 48"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink"><g>
                                <path d="M27,5c0-1.7-1.3-3-3-3s-3,1.3-3,3H5v2h38V5H27z M24,4c0.6,0,1,0.4,1,1h-2C23,4.4,23.4,4,24,4z"/>
                                <rect height="28" width="2" x="16" y="12"/>
                                <rect height="28" width="2" x="30" y="12"/>
                                <rect height="28" width="2" x="23" y="12"/>
                                <path d="M37,43c0,0.6-0.4,1-1,1H12c-0.6,0-1-0.4-1-1V9H9v34c0,1.7,1.3,3,3,3h24c1.7,0,3-1.3,3-3V9h-2V43z"/>
                            </g></svg>
                            <span>삭제</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>


        <div class="rounded-xl flex flex-col justify-center shadow-xl bg-white py-2">

            <div class="p-4 pr-8">
                <div class="p-4"><span class="text-2xl font-bold text-gray-800">기본정보</span></div>
                <div id="authors" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-800">저자 : </span>
                </div>
                <div id="publisher" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-800">출판사 : </span>
                </div>
                <div id="datetime" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-800">제작년도 : </span>
                </div>
                <div id="contents" class="flex flex-col pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold mb-2 text-gray-800">줄거리</span>
                </div>
                <div id="isbn_content" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-800">ISBN : </span>
                </div>
            </div>

            <div class="border-b-2 border-gray-300"></div>

            <div class="p-4">
                <div class="flex flex-row">
                    <span class="p-4 text-2xl font-bold text-gray-800 flex flex-row">코멘트</span>
                    <div class="pt-5 text-gray-600">
                        <c:if test="${!empty commentCount}">
                            Total : ${commentCount}
                        </c:if>
                    </div>
                </div>

                <div class="carousel carousel-center pl-4 pb-4 space-x-2 w-pull bg-white ">
                    <c:if test="${!empty commentsByMembers}">
                        <c:forEach var="comment" items="${commentsByMembers}">
                            <div class="carousel-item rounded-lg bg-gray-100 w-80 h-72 flex flex-col">
                                <div class="py-4 px-8">

                                    <div class="flex flex-row justify-between border-b-2 border-gray-300">
                                        <div class="flex flex-row space-x-2">
                                            <div class="pb-2">
                                                <c:if test="${comment.storedPic eq null}">
                                                    <div class="relative w-10 h-10 overflow-hidden bg-gray-100 rounded-full dark:bg-gray-600">
                                                        <svg class="absolute w-12 h-12 text-gray-400 pr-2"
                                                             fill="currentColor" viewBox="0 0 20 20"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd"
                                                                  d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z"
                                                                  clip-rule="evenodd"></path>
                                                        </svg>
                                                    </div>
                                                </c:if>
                                                <c:if test="${comment.storedPic ne null}">
                                                    <c:set var="idSub" value="${fn:substring(comment.id,0,5)}"/>
                                                    <c:if test="${idSub ne 'kakao'}">
                                                        <img src="<c:url value='/images/${comment.storedPic}'/>"
                                                             class="mask mask-circle w-10 h-10"/>
                                                    </c:if>
                                                    <c:if test="${idSub eq 'kakao'}">
                                                        <img src="<c:url value='http://${comment.storedPic}'/>"
                                                             class="mask mask-circle w-10 h-10"/>
                                                    </c:if>
                                                </c:if>
                                            </div>

                                            <div class="mt-2">
                                                <c:set var="idSub" value="${fn:substring(comment.id,0,5)}"/>
                                                <c:if test="${idSub ne 'kakao'}">
                                                    <div class="text-gray-600 text-sm">${comment.id}</div>
                                                </c:if>

                                                <c:if test="${idSub eq 'kakao'}">
                                                    <div class="text-gray-600 text-sm">${comment.name}</div>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div>
                                            <div id="star${comment.id}" class="mt-2"></div>
                                        </div>
                                    </div>

                                    <div class="border-b-2 border-gray-300 py-2">
                                        <c:if test="${comment.active == 0}">
                                            <textarea class="text-gray-800 box-content w-64 resize-none mt-2" rows="6" disabled>해당 코멘트는 권리자 권한으로 표시가 중지되었습니다.</textarea>
                                        </c:if>
                                        <c:if test="${comment.active == 1}">
                                        <textarea class="text-gray-800 box-content w-64 resize-none mt-2" rows="6"
                                                  id="content${comment.appraisalNo}"
                                                  disabled>${comment.comment}
                                        </textarea>
                                        </c:if>
                                    </div>

                                    <c:if test="${!empty comment.startDate}">
                                        <div class="flex flex-row px-2 py-2">
                                            <svg enable-background="new 0 0 32 32" height="20" id="Layer_1"
                                                 version="1.1"
                                                 viewBox="0 0 32 32" width="20" xml:space="preserve"
                                                 xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <g id="calendar_1_">
                                                    <path d="M29.334,3H25V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v2h-6V1c0-0.553-0.448-1-1-1s-1,0.447-1,1v2H9V1   c0-0.553-0.448-1-1-1S7,0.447,7,1v2H2.667C1.194,3,0,4.193,0,5.666v23.667C0,30.806,1.194,32,2.667,32h26.667   C30.807,32,32,30.806,32,29.333V5.666C32,4.193,30.807,3,29.334,3z M30,29.333C30,29.701,29.701,30,29.334,30H2.667   C2.299,30,2,29.701,2,29.333V5.666C2,5.299,2.299,5,2.667,5H7v2c0,0.553,0.448,1,1,1s1-0.447,1-1V5h6v2c0,0.553,0.448,1,1,1   s1-0.447,1-1V5h6v2c0,0.553,0.447,1,1,1s1-0.447,1-1V5h4.334C29.701,5,30,5.299,30,5.666V29.333z"
                                                          fill="#333332"/>
                                                    <rect fill="#333332" height="3" width="4" x="7" y="12"/>
                                                    <rect fill="#333332" height="3" width="4" x="7" y="17"/>
                                                    <rect fill="#333332" height="3" width="4" x="7" y="22"/>
                                                    <rect fill="#333332" height="3" width="4" x="14" y="22"/>
                                                    <rect fill="#333332" height="3" width="4" x="14" y="17"/>
                                                    <rect fill="#333332" height="3" width="4" x="14" y="12"/>
                                                    <rect fill="#333332" height="3" width="4" x="21" y="22"/>
                                                    <rect fill="#333332" height="3" width="4" x="21" y="17"/>
                                                    <rect fill="#333332" height="3" width="4" x="21" y="12"/>
                                                </g>
                                            </svg>
                                            <div class="ml-2 pr-2 text-gray-600" id="startDate${comment.appraisalNo}">
                                                    ${comment.startDate}
                                            </div>
                                            ~
                                            <div class="ml-3 text-gray-600" id="endDate${comment.appraisalNo}">
                                                    ${comment.endDate}
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>

        $(document).ready(function () {
//     		 # 상세페이지 실행하자마자 도서 데이터 요청
            var pageNum = 1;
            var isbn_query = "${isbn}";
            console.log("isbn_query:" + isbn_query);
            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book",
                data: {query: isbn_query, page: pageNum},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })

                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    $("#bookThumbnail").append("<img class='h-[20rem] shadow-xl rounded' src='" + msg.documents[0].thumbnail + "'/>");		//표지
                    $("#bookTitle").append("<div class='flex flex-col'><span class='font-semibold text-3xl'>" + msg.documents[0].title + "</span></div>");
                    $("#title").append("<span class='font-semibold text-xl'>" + msg.documents[0].title + "</span>");
                    $("#bookAuthor").append("<span class='text-xl'>" + msg.documents[0].authors + "</span>");
                    $("#authors").append("<h5> " + msg.documents[0].authors + "</h5>");		//저자
                    $("#publisher").append("<h5>" + msg.documents[0].publisher + "</h5>");		//출판사
                    $("#datetime").append("<h5>" + msg.documents[0].datetime.slice(0, 10) + "</h5>");		//일련번호
                    $("#contents").append("<h5>" + msg.documents[0].contents + "...</h5>");		//줄거리
                    $("#isbn_content").append("<h5>" + msg.documents[0].isbn.slice(-13) + "</h5>");		//일련번호
                    $("#isbn").val(msg.documents[0].isbn.slice(-13));
                });
        })

        $(document).ready(function () {
            $("#starMsgL").append("평가하기");

            //로그인한 회원이 별점을 남겼다면
            <c:if test="${!empty userStarMsg}">
            $("#starMsgL").hide();
            </c:if>

            //로그인한 회원이 읽고싶어요 / 읽는 중을 체크했다면
            <c:if test="${!empty userStatus}">
            $("#writeCommentBtn").show(writeCommentBtn());
            </c:if>

            //로그인한 회원이 코멘트를 남겼다면
            <c:if test="${!empty userStatusNo}">
            <c:forEach var="myComment" items="${myComment}">
            <c:if test="${!empty myComment.originPic}">
            $("#writeCommentBtn").hide();
            $("#myComment").show(
                myComment("${myComment.storedPic}", "${myComment.startDate}", "${myComment.endDate}", "${myComment.id}", "${myComment.comment}")
            );
            </c:if>
            </c:forEach>
            </c:if>


            //해당 도서의 모든 코멘트의 정보 묶어서 표시하기
            <c:if test="${!empty starByMembers}">
            <c:forEach var="starByMembers" items="${starByMembers}">
            <c:if test="${starByMembers.star==0 }">
            var star = 0;
            </c:if>
            <c:if test="${starByMembers.star==1 }">
            var star = 1;
            </c:if>
            <c:if test="${starByMembers.star==2 }">
            var star = 2;
            </c:if>
            <c:if test="${starByMembers.star==3 }">
            var star = 3;
            </c:if>
            <c:if test="${starByMembers.star==4 }">
            var star = 4;
            </c:if>
            <c:if test="${starByMembers.star==5 }">
            var star = 5;
            </c:if>
            allComment("${starByMembers.id}", star);
            </c:forEach>
            </c:if>


        }); //reload 끝

        //회원 id와 별점을 묶어서 코멘트창에 표시
        function allComment(id, star) {
            let starForComment = '';

            if (star == 0) {
                starForComment = '☆☆☆☆☆';
            } else if (star == 1) {
                starForComment = '★☆☆☆☆';
            } else if (star == 2) {
                starForComment = '★★☆☆☆';
            } else if (star == 3) {
                starForComment = '★★★☆☆';
            } else if (star == 4) {
                starForComment = '★★★★☆';
            } else if (star == 5) {
                starForComment = '★★★★★';
            }

            $("#star" + id).html(
                '<div class="text-yellow-400 text-xl">' + starForComment + '</div>'
            );
        }


        // 코멘트 작성 시 오늘 날짜 이후 선택 제한
        $("#submit1").click(function () {
            let date = new Date();
            let startDate = document.getElementById("startDate").value;
            let endDate = document.getElementById("endDate").value;

            function getFormatDate(date) {
                var year = date.getFullYear();              //yyyy
                var month = (1 + date.getMonth());          //M
                month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
                var day = date.getDate();                   //d
                day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
                return year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
            }

            let maxDate = getFormatDate(date);

            if (startDate > maxDate) {
                alert("날짜 선택이 잘못되었습니다.");
                return false;
            } else if (endDate > maxDate) {
                alert("날짜 선택이 잘못되었습니다.");
                return false;
            } else if (startDate > endDate) {
                alert("날짜 선택이 잘못되었습니다.");
                return false;
            }
        });

        // 코멘트 수정 시 오늘 날짜 이후 선택 제한
        $("#submit2").click(function () {
            let date = new Date();
            let startDate = document.getElementById("startDate_m").value;
            let endDate = document.getElementById("endDate_m").value;

            function getFormatDate(date) {
                var year = date.getFullYear();              //yyyy
                var month = (1 + date.getMonth());          //M
                month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
                var day = date.getDate();                   //d
                day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
                return year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
            }

            let maxDate = getFormatDate(date);

            if (startDate > maxDate) {
                alert("[독서 시작 날짜] 오늘 이후의 날짜는 선택할 수 없습니다");
                return false;
            } else if (endDate > maxDate) {
                alert("[독서 완료 날짜] 오늘 이후의 날짜는 선택할 수 없습니다");
                return false;
            }

            //코멘트 수정
            updateComment()
        });

        // 코멘트 수정
        function updateComment() {
            let isbn = "${isbn}";
            let startDate_m = $("#startDate_m").val();
            let endDate_m = $("#endDate_m").val();
            let comment_m = $("#comment_m").val();
            let coPrv_m = $(".coPrvM").val();

            console.log(isbn);
            console.log(comment_m);

            $.ajax({
                url: '<c:url value="/updateComment"/>',
                type: 'POST',
                data: JSON.stringify({
                    "comment": comment_m,
                    "startDate": startDate_m,
                    "endDate": endDate_m,
                    "coPrv": coPrv_m,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log(data);
                    location.reload();
                }, error: function (map) {
                    console.log("에러");
                }

            });
        }


        // 별 마우스 오버 starMsgUL
        function mouseOverUL(a) {
            let starMsg = document.getElementById("starMsgUL");
            starMsg.innerHTML = a;
        }

        function mouseOffUL(a) {
            let starMsg = document.getElementById("starMsgUL");
            starMsg.innerHTML = a;
        }

        // 별 마우스 오버 starMsgL
        function mouseOverL(a) {
            let starMsg = document.getElementById("starMsgL");
            starMsg.innerHTML = a;
        }

        function mouseOffL(a) {
            let starMsg = document.getElementById("starMsgL");
            starMsg.innerHTML = a;
        }

        // 별점 평가 등록, 수정, 삭제
        function star(star) {
            let isbn = "${isbn}";
            console.log(isbn)

            $.ajax({
                url: '<c:url value="/star"/>',
                type: 'POST',
                data: JSON.stringify({
                    "star": star,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    //deleteStar 성공 시
                    if (data == 1) {
                        console.log("delete 성공");
                        document.getElementById("userStarMsg").innerHTML = "평가하기";
                        $("input:radio[name='star']").prop("checked", false);
                    } else if (data.star != null) {
                        console.log("data.star : " + data.star);
                        console.log("data.starMsg : " + data.starMsg);

                        $("#starMsgL").hide();
                        document.getElementById("userStarMsg").innerHTML = data.starMsg;
                    }
                }, error: function (map) {
                    console.log("에러");
                }

            });
        }


        // 읽고싶어요, 읽는중 등록 또는 수정
        function insertStatus(status) {
            let userStatusNo = "${userStatusNo}";
            let isbn = "${isbn}";

            $.ajax({
                url: '<c:url value="/insertOrUpdate"/>',
                type: 'POST',
                data: JSON.stringify({
                    "status": status,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log("data : " + data);

                    if (userStatusNo.length != 0) {
                        $("#writeCommentBtn").off(writeCommentBtn());
                        return;
                    }

                    if (data == 0) {
                        $("#writeCommentBtn").show(writeCommentBtn());
                        $("input[name=read]").prop("checked", false);
                    } else if (data == 1) {
                        $("#writeCommentBtn").show(writeCommentBtn());
                        $("input[name=want]").prop("checked", false);
                    } else if (data == 2) {
                        $("#writeCommentBtn").hide(writeCommentBtn());
                    }
                }, error: function (data) {
                    console.log("에러");
                }

            });
        }


        // 코멘트 남기기 버튼 클릭 시 코멘트 작성 폼 보여짐
        function writeCommentBtn() {
            $("#writeCommentBtn").html(
                '<div class="p-4 text-center">' +
                '<label for="my-modal-3" class="btn modal-button w-96 bg-white border-white hover:bg-gray-200 hover:border-gray-200">코멘트 남기러가기</label>' +
                '</div>'
            );
        }

        // 읽고싶어요, 읽는 중 중복 클릭 시 기존 상태 삭제
        function deleteStatus(status) {
            let isbn = "${isbn}";

            $.ajax({
                url: '<c:url value="/delete"/>',
                type: 'POST',
                data: JSON.stringify({
                    "status": status,
                    "isbn": isbn
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log("data : " + data);
                    $("#writeCommentBtn").hide();
                }, error: function (data) {
                    console.log("에러");
                }
            });
        }

        // 공개 여부 체크 시 둘 중 하나만 선택
        function checkOnlyOne(chk) {
            let obj = document.getElementsByName("coPrv");
            for (var i = 0; i < obj.length; i++) {
                if (obj[i] != chk) {
                    obj[i].checked = false;
                }
            }
        }

        function myComment(pic, startDate, endDate, id, comment) {
            let kakaoName = "";
            let idSub = id.substring(0, 5);
            console.log(idSub);

            console.log(pic);
            console.log(id);
            console.log(comment);
            console.log(startDate);
            console.log(endDate);

            if (idSub == "kakao") {

                $.ajax({
                    url: '<c:url value="/requestKakaoName"/>',
                    type: 'POST',
                    data: JSON.stringify({
                        "id": id
                    }),
                    contentType: 'application/json',
                    success: function (data) {
                        console.log("data : " + data);
                        kakaoName = data;

                        //카카오 로그인 시 나의 코멘트(name 표시)

                        // 날짜 선택 안했을 경우
                        if (startDate.length == 0) {
                            $("#myComment_1").show();
                            // 날짜 선택 했을 경우
                        } else if (startDate.length != 0) {
                            $("#myComment_2").show();
                        }

                    }, error: function (data) {
                        console.log("에러");
                    }
                });
            } else if (idSub != "kakao") {
                //일반 로그인 시 나의 코멘트(id 표시)
                // 날짜 선택 안했을 경우
                if (startDate.length == 0) {
                    $("#myComment_3").show();
                    // 날짜 선택 했을 경우
                } else if (startDate.length != 0) {
                    $("#myComment_4").show();
                }
            }

        }

        function deleteComment() {
            let isbn = "${isbn}";

            if (confirm("코멘트를 삭제하시겠습니까?")) {
                $.ajax({
                    url: '<c:url value="/deleteComment"/>',
                    type: 'POST',
                    data: JSON.stringify({
                        "isbn": isbn
                    }),
                    contentType: 'application/json',
                    success: function (data) {
                        console.log("data : " + data);
                        location.reload();
                    }, error: function (data) {
                        console.log("에러");
                    }
                });
            }
        }
    </script>

</section>

<%@ include file="common/footer.jsp" %>
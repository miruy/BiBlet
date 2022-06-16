<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="common/header.jsp" %>

<section class="container">
    <div class="bg-white justify-center px-48 py-10">
        <div class="flex flex-col xl:flex-row ">
            <div id="bookThumbnail" class="flex-grow-1 w-60"></div>
            <div class="flex flex-col">
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
                            <div class="text-4xl cursor-pointer mt-3 text-center" onclick="alert('로그인 후 이용가능합니다.')">
                                &#x2795
                            </div>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600">코멘트</span>
                            <div class="text-3xl cursor-pointer mt-4 text-center" onclick="alert('로그인 후 이용가능합니다.')">
                                &#x270F
                            </div>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600">읽는중</span>
                            <div class="text-4xl cursor-pointer mt-4 text-center" onclick="alert('로그인 후 이용가능합니다.')">
                                &#x1F440
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${!empty authInfo}">
                        <%--로그인 시 선택 가능--%>
                        <div class="flex flex-col items-center justify-center">
                                <%--                            <c:if test="${empty userStarMsg}">--%>
                            <span id="starMsgL" class="text-gray-600"></span>
                                <%--                            </c:if>--%>
                            <span id="userStarMsg" class="text-gray-600">${userStarMsg}</span>
                            <div class="star-group flex text-5xl flex-row-reverse mt-2">
                                <input type="radio" id="star1" value=5 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 5}">checked="checked"</c:if>/>
                                <label for="star1"
                                       class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star2" value=4 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 4}">checked="checked"</c:if>/>
                                <label for="star2"
                                       class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star3" value=3 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 3}">checked="checked"</c:if>/>
                                <label for="star3"
                                       class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star4" value=2 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 2}">checked="checked"</c:if>/>
                                <label for="star4"
                                       class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer"
                                       onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star5" value=1 name="star" class="hidden" onclick="star(value)"
                                       onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')"
                                       <c:if test="${userStar == 1}">checked="checked"</c:if>/>
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
                                <div class="swap-on text-3xl" onclick="insertStatus(0)">&#x2714</div>
                                <div class="swap-off text-4xl" onclick="deleteStatus(0)">&#x2795</div>
                            </label>
                        </div>

                        <c:if test="${!empty userStatusNo}">
                            <div class="flex flex-col">
                                <span class="text-gray-600 mb-2 ml-2">코멘트</span>
                                <div class="dropdown">
                                    <div tabindex="0"
                                         class="btn m-1 bg-white border-white hover:bg-white hover:border-white text-3xl">
                                        &#x270F
                                    </div>
                                    <ul tabindex="0"
                                        class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-36">
                                        <li><label for="modifyComment"
                                                   class="text-gray-600 hover:text-white justify-center items-center">코멘트 수정</label></li>
                                        <li><a class="text-gray-600 hover:text-white justify-center items-center" onclick="deleteComment()">코멘트 삭제</a></li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${empty userStatusNo}">
                            <div class="flex flex-col">
                                <span class="text-gray-600 mb-2 ml-2">코멘트</span>
                                <label for="my-modal-3"
                                       class="btn modal-button bg-white border-white hover:bg-white hover:border-white text-3xl">&#x270F</label>
                            </div>
                        </c:if>

                        <div class="flex flex-col">
                            <span class="text-gray-600 mb-2">읽는중</span>
                            <label class="swap mt-2">
                                <input name="read" type="checkbox"
                                       <c:if test="${userStatus == 1}">checked="checked"</c:if>/>
                                <div class="swap-on text-3xl" onclick="insertStatus(1)">&#x1F4D6</div>
                                <div class="swap-off text-3xl" onclick="deleteStatus(1)">&#x1F440</div>
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
                <textarea class="content w-full text-gray-600" rows="13" id="comment" name="comment"
                          placeholder="이 작품의 대한 생각을 자유롭게 표현해주세요."></textarea>
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
                <textarea class="content w-full p-8 text-gray-600 mt-6" rows="12" id="comment_m" name="comment"
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

    <div class="bg-gray-100 px-48 py-10">


        <div id="writeCommentBtn" class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4"></div>
        <div id="myComment" class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4"></div>

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

            <div class="border-b-2 border-blue-100"></div>

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
                                <div class="p-4 space-x-4">
                                    <div class="flex flex-row border-b-2 border-gray-300 mt-2">
                                        <div class="ml-4 mr-2 text-gray-600">${comment.originPic}</div>

                                        <c:set var="idSub" value="${fn:substring(comment.id,0,5)}" />
                                            <c:if test="${idSub ne 'kakao'}">
                                                <div class="text-gray-600 text-sm">${comment.id}</div>
                                            </c:if>

                                            <c:if test="${idSub eq 'kakao'}">
                                                <div class="text-gray-600 text-sm">${comment.name}</div>
                                            </c:if>

                                        <div id="star${comment.id}"></div>
                                    </div>

                                    <div class="border-b-2 border-gray-300 py-2">
                                        <textarea class="text-gray-800 box-content w-64 resize-none" rows="7"
                                                  id="content${comment.appraisalNo}"
                                                 disabled>${comment.comment}</textarea>
                                    </div>

                                    <div class="flex flex-row px-2 py-2">
                                        <div>&#x1F4C6</div>
                                        <div class="ml-2 pr-2 text-gray-600" id="startDate${comment.appraisalNo}">
                                                ${comment.startDate}
                                        </div>
                                        ~
                                        <div class="ml-3 text-gray-600" id="endDate${comment.appraisalNo}">
                                                ${comment.endDate}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

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
                myComment("${myComment.originPic}", "${myComment.startDate}", "${myComment.endDate}", "${myComment.id}", "${myComment.comment}")
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
                '<div class="ml-16 text-yellow-400">' + starForComment + '</div>'
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
            } else if(startDate > endDate){
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
                    if(data == 1){
                        console.log("delete 성공");
                        document.getElementById("userStarMsg").innerHTML = "평가하기";
                        $("input:radio[name='star']").prop("checked", false);
                    }else if(data.star != null){
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
            let idSub = id.substring(0,5);
            console.log(idSub);

            console.log(pic);
            console.log(id);
            console.log(comment);
            console.log(startDate);
            console.log(endDate);

            if(idSub == "kakao"){

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
                        $("#myComment").html(
                            '<div class="flex flex-row justify-center items-center text-center space-x-4">'+
                                '<span class="text-gray-600">' + pic + '</span>' +
                                '<span class="text-gray-600 text-sm">' + kakaoName + '</span>' +
                                '<textarea class="my-[1.2rem] text-gray-600 resize-none w-64 bg-white" rows="1" disabled>' + comment + '</textarea>'+
                                '<div class="flex flex-row space-x-4">'+
                                    '<div class="flex flex-col">'+
                                        '<div class="text-gray-400 text-xs">독서시작날짜</div>' +
                                        '<div class="text-gray-600">'+ startDate + '</div>'+
                                    '</div>'+
                                    '<div class="flex flex-col pr-2">'+
                                        '<div class="text-gray-400 text-xs">독서완료날짜</div>' +
                                        '<div class="text-gray-600">'+ endDate + '</div>'+
                                    '</div>'+
                                '</div>'+
                                '<label class="flex flex-row">' +
                                    '<label for="modifyComment" class="text-gray-400 hover:text-black pr-2"><div>&#x1F4DD</div>수정' +  '</label>' +
                                '</label>' +
                                '<div class="text-gray-400 hover:text-black" onclick="deleteComment()"><div>&#x1F5D1</div>삭제' + '</div>'+
                            '</div>'
                        );

                    }, error: function (data) {
                        console.log("에러");
                    }
                });
            }

            //일반 로그인 시 나의 코멘트(id 표시)
            $("#myComment").html(
                '<div class="flex flex-row justify-center items-center text-center space-x-4">'+
                    '<span class="text-gray-600">' + pic + '</span>' +
                        ''+
                        '<span class="text-gray-600 text-sm">' + id + '</span>' +
                        ''+
                    '<textarea class="my-[1.2rem] text-gray-600 resize-none w-64 bg-white" rows="1" disabled>' +
                         comment +
                    '</textarea>'+
                    '<div class="flex flex-row space-x-4">'+
                        '<div class="flex flex-col">'+
                            '<div class="text-gray-400 text-xs">독서시작날짜</div>' +
                            '<div class="text-gray-600">'+ startDate + '</div>'+
                        '</div>'+
                        '<div class="flex flex-col pr-2">'+
                            '<div class="text-gray-400 text-xs">독서완료날짜</div>' +
                            '<div class="text-gray-600">'+ endDate + '</div>'+
                        '</div>'+
                    '</div>'+
                    '<label class="flex flex-row">' +
                        '<label for="modifyComment" class="text-gray-400 hover:text-black pr-2"><div>&#x1F4DD</div>수정' + '</label>' +
                    '</label>' +
                    '<div class="text-gray-400 hover:text-black" onclick="deleteComment()"><div>&#x1F5D1</div>삭제' + '</div>'+
                '</div>'
            );
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
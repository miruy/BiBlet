<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container">
    <div class="bg-white px-48 py-10">
        <div class="flex flex-col xl:flex-row ">
            <div id="bookThumbnail" class="flex-grow-1 w-60"></div>
            <div class="flex flex-col">
                <div id="bookTitle" class="flex flex-col mt-6"></div>
                <div class="flex flex-col">
                    <div id="bookAuthor" class="text-gray-500 flex-row mt-2"></div>
                    <div class="text-l mt-2">
                        <c:if test="${!empty starAVG}">
                            평균 ★ ${starAVG} (${starCount}명)
                        </c:if>
                    </div>
                </div>

                <div class="flex flex-row mt-24 space-x-16">

                    <%--회원이 아닌 상태에서 보여지는 스타--%>
                    <c:if test="${empty authInfo}">
                        <div class="flex flex-col items-center justify-center">
                            <span id="starMsgUL" class="text-gray-600 mb-2">평가하기</span>
                            <div class="star-group flex text-5xl flex-row-reverse">
                                <input type="radio" id="star-1" class="hidden" onclick="alert('로그인 후 이용가능합니다.')" onmouseover="mouseOverUL('최고예요!')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-1" class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onclick="alert('로그인 후 이용가능합니다.')" onmouseover="mouseOverUL('최고예요!')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-2" class="hidden" onmouseover="mouseOverUL('재미있어요')" onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-2" class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverUL('재미있어요')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-3" class="hidden" onmouseover="mouseOverUL('보통이에요')" onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-3" class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverUL('보통이에요')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-4" class="hidden" onmouseover="mouseOverUL('재미없어요')" onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-4" class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverUL('재미없어요')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                                <input type="radio" id="star-5" class="hidden" onmouseover="mouseOverUL('싫어요')" onclick="alert('로그인 후 이용가능합니다.')" onmouseout="mouseOffUL('평가하기')"/>
                                <label for="star-5" class="s5 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverUL('싫어요')" onmouseout="mouseOffUL('평가하기')">&#9733;</label>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽고싶어요</span>
                            <div class="text-4xl cursor-pointer mt-3 text-center" onclick="alert('로그인 후 이용가능합니다.')">&#x2795</div>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600">코멘트</span>
                            <div class="text-3xl cursor-pointer mt-4 text-center" onclick="alert('로그인 후 이용가능합니다.')">&#x270F</div>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600">읽는중</span>
                            <div class="text-4xl cursor-pointer mt-4 text-center" onclick="alert('로그인 후 이용가능합니다.')">&#x1F440</div>
                        </div>
                    </c:if>

                    <c:if test="${!empty authInfo}">
<%--                         회원인 상태에서 보여지는 스타--%>
                        <div class="flex flex-col items-center justify-center">
                            <span id="starMsgL" class="text-gray-600">평가하기</span>
                            <span id="starMsgL_s"></span>
                            <c:if test="${!empty userStarMsg}">
                                <span class="text-gray-600">${userStarMsg}</span>
                            </c:if>
                            <div class="star-group flex text-5xl flex-row-reverse mt-2">
                                <input type="radio" id="star1" value=5 name="star" class="hidden" onclick="insertStar(value)" onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')" <c:if test="${userStar == 5}">checked="checked"</c:if>/>
                                <label for="star1" class="s1 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverL('최고예요!')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star2" value=4 name="star" class="hidden" onclick="insertStar(value)" onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')" <c:if test="${userStar == 4}">checked="checked"</c:if>/>
                                <label for="star2" class="s2 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverL('재미있어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star3" value=3 name="star" class="hidden" onclick="insertStar(value)" onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')" <c:if test="${userStar == 3}">checked="checked"</c:if>/>
                                <label for="star3" class="s3 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverL('보통이에요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star4" value=2 name="star" class="hidden" onclick="insertStar(value)" onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')" <c:if test="${userStar == 2}">checked="checked"</c:if>/>
                                <label for="star4" class="s4 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverL('재미없어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                                <input type="radio" id="star5" value=1 name="star" class="hidden" onclick="insertStar(value)" onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')" <c:if test="${userStar == 1}">checked="checked"</c:if>/>
                                <label for="star5" class="s5 text-gray-200 hover:text-yellow-400 hover:text-opacity-80 cursor-pointer" onmouseover="mouseOverL('싫어요')" onmouseout="mouseOffL('평가하기')">&#9733;</label>
                            </div>
                        </div>

                        <div class="flex flex-col">
                            <span class="text-gray-600">읽고싶어요</span>
                            <label class="swap mt-2">
                                <input type="checkbox"/>
                                <div class="swap-on text-3xl">&#x2714</div>
                                <div class="swap-off text-4xl">&#x2795</div>
                            </label>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600 mb-2 ml-2">코멘트</span>
                            <label for="my-modal-3"
                                   class="btn modal-button bg-white border-white hover:bg-white hover:border-white text-3xl">&#x270F</label>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-gray-600 mb-2">읽는중</span>
                            <label class="swap mt-2">
                                <input type="checkbox"/>
                                <div class="swap-on text-3xl">&#x1F4D6</div>
                                <div class="swap-off text-3xl">&#x1F440</div>
                            </label>
                        </div>
                    </c:if>

<%--                    <div class="flex flex-col">--%>
<%--                        <span class="text-gray-600">읽고싶어요</span>--%>
<%--                        <label class="swap mt-2">--%>
<%--                            <input type="checkbox"/>--%>
<%--                            <div class="swap-on text-3xl" onclick="insertStatus(0)">&#x2714</div>--%>
<%--                            <div class="swap-off text-4xl" onclick="deleteStatus(0)">&#x2795</div>--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                    <div class="flex flex-col">--%>
<%--                        <span class="text-gray-600 mb-2 ml-2">코멘트</span>--%>
<%--                        <label for="my-modal-3"--%>
<%--                               class="btn modal-button bg-white border-white hover:bg-white hover:border-white text-3xl">&#x270F</label>--%>
<%--                    </div>--%>
<%--                    <div class="flex flex-col">--%>
<%--                        <span class="text-gray-600 mb-2">읽는중</span>--%>
<%--                        <label class="swap mt-2">--%>
<%--                            <input type="checkbox"/>--%>
<%--                            <div class="swap-on text-3xl" onclick="insertStatus(1)">&#x1F4D6</div>--%>
<%--                            <div class="swap-off text-3xl" onclick="deleteStatus(1)">&#x1F440</div>--%>
<%--                        </label>--%>
<%--                    </div>--%>

                </div>
            </div>
        </div>
    </div>

    <input type="checkbox" id="my-modal-3" class="modal-toggle"/>
    <div class="modal bg-opacity-60 bg-gray-300">
        <div class="modal-box relative space-y-2 h-5/6 w-11/12 max-w-3xl">
            <label for="my-modal-3" class="btn btn-sm btn-circle absolute right-2 top-2">✕</label>
            <div id="title" class="text-gray-600 mb-3 text-center"></div>
            <textarea class="textarea textarea-secondary w-full text-gray-600" rows="12" id="comment" name="comment"
                      placeholder="이 작품의 대한 생각을 자유롭게 표현해주세요."></textarea>
            <div class="ml-56">
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
                    <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrv"
                           name="coPrv"
                           value="공개" onclick='checkOnlyOne(this)'/>
                    <span>비공개 </span>
                    <input class="checkbox checkbox-secondary checkbox-sm mt-1" type="checkbox" id="coPrv"
                           name="coPrv"
                           value="비공개"
                           onclick='checkOnlyOne(this)'/>
                </div>
            </div>
            <div class="modal-action justify-center items-center">
                <label for="my-modal-3" class="btn">저장</label>
            </div>
        </div>
    </div>

    <div class="bg-gray-100 pl-24 pr-24 pt-8 pb-8">

        <div id="writeCommentBtn" class="rounded-xl flex flex-col justify-center shadow-xl bg-white mb-4"></div>

        <div class="rounded-xl flex flex-col justify-center shadow-xl bg-white py-2">
            <div class="p-4 pr-8">
                <div class="p-4"><span class="text-2xl font-bold text-gray-600">기본정보</span></div>
                <div id="authors" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">저자 : </span>
                </div>
                <div id="publisher" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">출판사 : </span>
                </div>
                <div id="datetime" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">제작년도 : </span>
                </div>
                <div id="contents" class="flex flex-col pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold mb-2 text-gray-600">줄거리</span>
                </div>
                <div id="isbn_content" class="flex pl-4 pb-2 space-x-2">
                    <span class="text-xl font-semibold text-gray-600">ISBN : </span>
                </div>
            </div>

            <div class="border-b-2 border-blue-100"></div>

            <div class="p-4">
                <div class="flex flex-row">
                    <span class="p-4 text-2xl font-bold text-gray-600 flex flex-row">코멘트</span>
                    <div class="pt-5 text-gray-600">
                        <c:if test="${!empty commentCount}">
                            Total : ${commentCount}
                        </c:if>
                    </div>
                </div>

                <div class="carousel carousel-center pl-4 pb-4 space-x-2 w-pull bg-white ">
                    <div class="carousel-item rounded-lg bg-gray-100 w-80 h-72 flex flex-col">
                        <c:if test="${!empty commentsByMembers}">
                            <c:forEach var="comment" items="${commentsByMembers}">
                                <div class="p-4 space-x-4">
                                    <div class="flex flex-row border-b-2 border-gray-300">
                                        <div class="mr-2 text-gray-600">${comment.originPic}</div>
                                        <div class="text-gray-600">${comment.id}</div>
                                        <div class="ml-24 text-yellow-400" id="star${comment.appraisalNo}">
                                            <c:if test="${comment.star==1 }">★☆☆☆☆</c:if>
                                            <c:if test="${comment.star==2 }">★★☆☆☆</c:if>
                                            <c:if test="${comment.star==3 }">★★★☆☆</c:if>
                                            <c:if test="${comment.star==4 }">★★★★☆</c:if>
                                            <c:if test="${comment.star==5 }">★★★★★</c:if>
                                        </div>
                                    </div>
                                    <div class="mt-3 text-gray-600"
                                         id="content${comment.appraisalNo}">${comment.comment}</div>
                                    <div class="flex flex-row mt-28 px-5">
                                        <div>&#x1F4C6</div>
                                        <div class="ml-2 text-gray-600" id="startDate${comment.appraisalNo}">
                                                ${comment.startDate}
                                        </div>
                                        <div class="ml-3 text-gray-600" id="endDate${comment.appraisalNo}">
                                                ${comment.endDate}
                                        </div>
                                    </div>
                                    <div class="text-center text-gray-600">
                                        <input class="btn btn-secondary my-2 my-sm-0 mr-2" type="button" value="삭제"
                                               onclick='deleteBtn(${comment.appraisalNo})'/>
                                        <input class="btn btn-secondary my-2 my-sm-0 mr-2" type='button' value='수정'
                                               onclick='updateBtn(${comment.appraisalNo})'/>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
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

        $(document).ready(function(){
            <c:if test="${!empty userStarMsg}">
                $("#starMsgL").hide();
            </c:if>
        });


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
        


        // 별점 평가 등록
        function insertStar(star) {
            let id = "${sessionScope.id}";
            console.log(id)
            let isbn = "${isbn}";
            console.log(isbn)

            $.ajax({
                url: '<c:url value="/star"/>',
                type: 'POST',
                data: JSON.stringify({
                    "star": star,
                    "isbn": isbn,
                    "id": id
                }),
                contentType: 'application/json',
                success: function (map) {
                    console.log("map.star : " + map.star);
                    console.log("map.starMsg : " + map.starMsg);
                    $("#starMsgL").hide();
                    $("#starMsgL_s").append("<span class='text-gray-600'>" + map.starMsg + "</span>");
                }, error: function (map) {
                    console.log("에러");
                }

            });
        }


        // 읽고싶어요, 읽는중 등록
        function insertStatus(status) {
            let id = "${sessionScope.id}";
            let isbn = "${isbn}";

            $.ajax({
                url: '<c:url value="/insert"/>',
                type: 'POST',
                data: JSON.stringify({
                    "status": status,
                    "isbn": isbn,
                    "id": id
                }),
                contentType: 'application/json',
                success: function (data) {
                    console.log("data : " + data);
                    $("#writeCommentBtn").show(writeCommentBtn());
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
            let id = "${sessionScope.id}";
            let isbn = "${isbn}";

            if (id.length == 0) {
                alert("로그인 후 이용가능합니다.")
            }

            $.ajax({
                url: '<c:url value="/delete"/>',
                type: 'POST',
                data: JSON.stringify({
                    "status": status,
                    "isbn": isbn,
                    "id": id
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

    </script>

</section>

<%@ include file="common/footer.jsp" %>
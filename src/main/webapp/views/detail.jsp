<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mt-4">

    <div class="flex flex-col bg-gray-50 px-4 lg:px-16 pb-16 rounded-xl mx-auto lg:mx-[10%] shadow-xl rounded">
        <div class="flex flex-col xl:flex-row items-center justify-between">
            <div id="bookThumbnail"></div>
            <form:form method="POST" commandName="insertCmd" onsubmit="return bookSubmit()" class="px-4 space-y-4">
                <div id="bookTitle" class="flex flex-col justify-center items-center mt-16 text-gray-600"></div>
                <div class="flex space-x-4 ">
                    <div>
                        <span class="flex flex-col justify-center items-center mt-3 text-gray-600">평가하기</span>
                        <div class="star-rating">
                            <input type="radio" id="5-star" name="star" value=5/>
                            <label for="5-star" class="star">&#9733;</label>
                            <input type="radio" id="4-star" name="star" value=4/>
                            <label for="4-star" class="star">&#9733;</label>
                            <input type="radio" id="3-star" name="star" value=3/>
                            <label for="3-star" class="star">&#9733;</label>
                            <input type="radio" id="2-star" name="star" value=2/>
                            <label for="2-star" class="star">&#9733;</label>
                            <input type="radio" id="1-star" name="star" value=1/>
                            <label for="1-star" class="star">&#9733;</label>
                        </div>
                    </div>
                    <div>
                        <div class="flex flex-col justify-center items-center mb-2 text-gray-600">독서 상태</div>
                        <div class="flex flex-row justify-center items-center">
                            <select id="option" name="option" onChange="bookStatus()"
                                    class="select select-secondary w-pull text-gray-600">
                                <option disabled selected>=== 선택 ===</option>
                                <option value=0>찜</option>
                                <option value=1>보는 중</option>
                                <option value=2>독서 완료</option>
                            </select>
                            <button class="btn btn-secondary ml-5 text-gray-600" id='insertStatus'
                                    onclick="insertStatus()">등록
                            </button>
                        </div>
                        <div class="flex flex-nowrap mt-2 text-gray-600"><span>* 독서 완료 시에만 평가 작성이 가능합니다.</span></div>
                    </div>
                </div>
                <div class="flex flex-col p-2">
                    <h3 class="ml-4 mb-2 text-gray-600">코멘트</h3>
                    <textarea class="textarea textarea-secondary" rows="5" id="book_comment" name="book_comment"
                              placeholder="이 작품의 대한 생각을 자유롭게 표현해주세요."></textarea>
                </div>
                <div class="flex flex-col justify-center items-center space-y-4">
                    <div class="space-y-2 text-gray-600">
                        <div>
                            <span>독서 시작 날짜 : </span>
                            <input type="date" id="start_date" name="start_date"/>
                        </div>
                        <div>
                            <span>독서 완료 날짜 : </span>
                            <input type="date" id="end_date" name="end_date"/>
                        </div>
                    </div>
                    <div class="text-gray-600">
                        <span> 공개 여부 :</span>
                        <span>공개 </span>
                        <input class="checkbox checkbox-secondary mr-2" type="checkbox" id="co_prv" name="co_prv"
                               value="공개" onclick='checkOnlyOne(this)'/>
                        <span>비공개 </span>
                        <input class="checkbox checkbox-secondary" type="checkbox" id="co_prv" name="co_prv" value="비공개"
                               onclick='checkOnlyOne(this)'/>
                        <input type="hidden" name="isbn" id="isbn" value="${isbn}"/>
                        <input type="hidden" name="query" id="query" value="${query}"/>
                    </div>
                    <div>
                        <input class="btn btn-secondary text-gray-600" type="submit" value="코멘트 등록하기"
                               id="writeComment"/>
                    </div>
                    <div>
                        <span class="text-gray-600" id="msg"></span>
                    </div>
                </div>
            </form:form>
        </div>

        <div class="flex flex-col justify-center shadow-xl rounded bg-blue-50">
            <div class="border-b-2 p-4 border-white"><span class="text-2xl font-bold text-gray-600">기본정보</span></div>
            <div id="authors" class="flex p-4 space-x-2">
                <span class="text-xl font-semibold text-gray-600">저자 : </span>
            </div>
            <div id="publisher" class="flex p-4 space-x-2">
                <span class="text-xl font-semibold text-gray-600">출판사 : </span>
            </div>
            <div id="datetime" class="flex p-4 space-x-2">
                <span class="text-xl font-semibold text-gray-600">제작년도 : </span>
            </div>
            <div id="contents" class="flex flex-col p-4 space-x-2">
                <span class="text-xl font-semibold mb-2 text-gray-600">줄거리</span>
            </div>
            <div id="isbn_content" class="flex p-4 space-x-2">
                <span class="text-xl font-semibold text-gray-600">ISBN : </span>
            </div>
        </div>
    </div>

    <c:if test="${!empty commentCount}">
        평가 총 개수 : ${commentCount}
    </c:if>


    <table class="table table-hover" style="width: 100%;">
        <thead>
        <tr>
            <th scope="col"><div style="padding-left:70px;">ID</div></th>
            <th scope="col"><div style="padding-left:70px;">코멘트</div></th>
            <th scope="col"><div style="padding-left:90px;">평가</div></th>
            <th scope="col"><div style="padding-left:50px;">독서 시작 날짜</div></th>
            <th scope="col"><div style="padding-left:40px;">독서 완료 날짜</div></th>
            <th scope="col"><div style="padding-left:30px;">수정/삭제</div></th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty commentsByMembers}">
            <c:forEach var="comment" items="${commentsByMembers}">
                <tr class="table-light">
                    <th scope="row">
                        <div style="padding-left:60px;">${comment.mem_id}</div>
                    </th>
                    <td><div id="content${comment.appraisal_num}" style="padding-left:60px;">${comment.book_comment}</div></td>
                    <td>
                        <div id="star${comment.appraisal_num}" style="padding-left:60px;">
                            <c:if test="${comment.star==1 }">★☆☆☆☆</c:if>
                            <c:if test="${comment.star==2 }">★★☆☆☆</c:if>
                            <c:if test="${comment.star==3 }">★★★☆☆</c:if>
                            <c:if test="${comment.star==4 }">★★★★☆</c:if>
                            <c:if test="${comment.star==5 }">★★★★★</c:if>
                        </div>
                    </td>
                    <td><div id="startDate${comment.appraisal_num}" style="padding-left:50px;">${comment.start_date}</div></td>
                    <td><div id="endDate${comment.appraisal_num}" style="padding-left:40px;">${comment.end_date}</div></td>
                    <td>
                        <input class="btn btn-secondary my-2 my-sm-0" type="button" value="삭제" onclick='deleteBtn(${comment.appraisal_num})' />
                        <input class="btn btn-secondary my-2 my-sm-0" type='button' value='수정' onclick='updateBtn(${comment.appraisal_num})' />

                        <div style="float: right; ">
                            <div id="pd${comment.appraisal_num}"></div>
                            <div id="pu${comment.appraisal_num}"></div>
                        </div>

                    </td>
                </tr>

                <div id="u${comment.appraisal_num}"></div>

            </c:forEach>
        </c:if>
        </tbody>
    </table>


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
                    $("#bookThumbnail").append("<img class='h-[30rem] shadow-xl rounded-xl' src='" + msg.documents[0].thumbnail + "'/>");		//표지
                    $("#bookTitle").append("<span class='font-semibold text-3xl'>" + msg.documents[0].title + "</span><span class='text-2xl'>" + msg.documents[0].authors + "</span>");
                    $("#authors").append("<h5> " + msg.documents[0].authors + "</h5>");		//저자
                    $("#publisher").append("<h5>" + msg.documents[0].publisher + "</h5>");		//출판사
                    $("#datetime").append("<h5>" + msg.documents[0].datetime.slice(0, 10) + "</h5>");		//일련번호
                    $("#contents").append("<h5>" + msg.documents[0].contents + "...</h5>");		//줄거리
                    $("#isbn_content").append("<h5>" + msg.documents[0].isbn.slice(-13) + "</h5>");		//일련번호
                    $("#isbn").val(msg.documents[0].isbn.slice(-13));
                });

        })

        //       	# '독서 완료'시 평가 작성 가능
        let submitFlag = false;

        let bookStatus = function () {
            let select = document.getElementById("option");
            let selectValue = select.options[document.getElementById("option").selectedIndex].value;
            if (selectValue == 2) {
                submitFlag = true;
                $("#insertStatus").hide();

            } else {
                submitFlag = false;
                $("#insertStatus").show();

                $("#insertStatus").click(function () {
                    insertStatus();
                })
            }
            console.log("flag : " + submitFlag);
        }

        let bookSubmit = function () {
            let msg = document.getElementById("msg");
            if (!submitFlag) {
                msg.innerHTML = "독서 완료 시에만 평가 작성이 가능합니다.";
            }

            return submitFlag;
        }
    </script>
</section>

<%@ include file="common/footer.jsp" %>
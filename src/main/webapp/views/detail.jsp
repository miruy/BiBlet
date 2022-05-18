<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="common/header.jsp" %>

<section class="container mx-auto">

    <div class="card xl:w-auto xl:h-auto bg-blue-50">
        <figure><div class="mt-20 mr-96 pr-96" id="bookThumbnail"></div></figure>
        <div class="card-body">
            <div class="flex flex-row" id="bookTitle" ></div>
            <h2 class="card-title">New album is released!</h2>
            <p>Click the button to listen on Spotiwhy app.</p>
            <div class="card-actions justify-end">
                <button class="btn btn-primary">Listen</button>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div style="margin-top: 40px;" class="col-4">
            </div>
            <div class="col-6">
                <div style="padding-top:40px; padding-left:100px;" id="comment">
               c
                    <form:form method="post" commandName="insertCmd" onsubmit="return bookSubmit()">

                        <div style="float: right;">
                            <div style="padding-left: 30px;">독서 상태</div>
                            <select style="width:120px; height:36px;" id="option" name="option" onChange="bookStatus()" >
                                <option value="none">=== 선택 ===</option>
                                <option value=0>찜</option>
                                <option value=1>보는 중</option>
                                <option value=2>독서 완료</option>
                            </select>
                            <button class="btn btn-secondary my-2 my-sm-0" id='insertStatus' onclick="insertStatus()">등록</button>
                            <div class="text-muted" >* 독서 완료 시에만 평가 작성이 가능합니다.</div>
                        </div>

                        <div style="padding-left: 70px; margin-top: 30px;" >평가하기</div>

                        <div class="star-rating">
                            <input type="radio" id="5-star" name="star" value=5 />
                            <label for="5-star" class="star">&#9733;</label>
                            <input type="radio" id="4-star" name="star" value=4 />
                            <label for="4-star" class="star">&#9733;</label>
                            <input type="radio" id="3-star" name="star" value=3 />
                            <label for="3-star" class="star">&#9733;</label>
                            <input type="radio" id="2-star" name="star" value=2 />
                            <label for="2-star" class="star">&#9733;</label>
                            <input type="radio" id="1-star" name="star" value=1 />
                            <label for="1-star" class="star">&#9733;</label>
                        </div>

                        <h3 style="margin-top: 20px;">코멘트</h3>
                        <textarea class="form-control" rows="5" id="book_comment" name="book_comment"
                                  placeholder="이 작품의 대한 생각을 자유롭게 표현해주세요."></textarea>


                        <div style="float: left; margin-top: 20px; margin-left: 25px;">독서 시작 날짜 : <input type="date" id="start_date" name="start_date" /></div>
                        <div style="float: left; margin-top: 20px; margin-left: 25px;">독서 완료 날짜 : <input type="date" id="end_date" name="end_date" /></div>

                        <div style="float: left; margin-top: 20px; margin-left: 145px;"> 공개 여부 :</div>

                        <div style="float: left; margin-top: 20px; margin-left: 25px;">
                            공개 <input class="form-check-input" type="checkbox" id="co_prv" name="co_prv" value="공개" onclick='checkOnlyOne(this)'/>
                        </div>

                        <div style="float: left; margin-top: 20px; margin-left: 25px;">
                            비공개<input class="form-check-input" type="checkbox" id="co_prv" name="co_prv" value="비공개" onclick='checkOnlyOne(this)'/>
                        </div>


                        <input type="hidden" name="isbn" id="isbn" value="${isbn}" />
                        <input type="hidden" name="query" id="query" value="${query}" />

                        <div  style="float: left; margin-top: 20px; margin-left: 200px;">
                            <input class="btn btn-secondary my-2 my-sm-0" type="submit" value="코멘트 등록하기" id="writeComment" />
                            <span id="msg" ></span>
                        </div>

                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

//     		 # 상세페이지 실행하자마자 도서 데이터 요청
            var pageNum = 1;
            var isbn_query = "${isbn}";
            console.log("isbn_query:"+isbn_query);
            $.ajax({	//카카오 검색요청 / [요청]
                method: "GET",
                url: "https://dapi.kakao.com/v3/search/book",
                data: { query: isbn_query, page: pageNum},
                headers: {Authorization: "KakaoAK 6f9ab74953bbcacc4423564a74af264e"}
            })

                .done(function (msg) {	//검색 결과 담기 / [응답]
                    console.log(msg);
                    $("#bookThumbnail").append("<img class='lg:w-70 lg:h-80' src='" + msg.documents[0].thumbnail + "'/><br>");		//표지
                    $("#bookTitle").append("<h2>"+ msg.documents[0].title + "</h2>저자 : "+msg.documents[0].authors);	//제목
                    $("#bookInfo").append("<h4 style='display:inline' class='text-primary'>저자:</h4><h5 style='display:inline'> " + msg.documents[0].authors + "</h5><br>");		//저자
                    $("#bookInfo").append("<h4 style='display:inline' class='text-primary'>출판사:</h4> <h5 style='display:inline'>" + msg.documents[0].publisher + "</h5><br>");		//출판사
                    $("#bookInfo").append("<h4 style='display:inline' class='text-primary'>제작년도:</h4> <h5 style='display:inline'>" + msg.documents[0].datetime.slice(0,10) + "</h5><br>");		//일련번호
                    $("#bookInfo").append("<h4 class='text-primary'>줄거리</h4> <h5>" + msg.documents[0].contents + "...</h5>");		//줄거리
                    $("#bookInfo").append("<h4 style='display:inline' class='text-primary'>ISBN:</h4> <h5 style='display:inline'>" + msg.documents[0].isbn.slice(-13) + "</h5><br>");		//일련번호
                    $("#isbn").val(msg.documents[0].isbn.slice(-13));
                });

        })

    </script>
</section>

<%@ include file="common/footer.jsp" %>
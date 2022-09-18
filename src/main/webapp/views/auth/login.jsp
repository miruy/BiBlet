<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">

    <div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">

        <div class="text-center mb-[0.7rem]">
            <h1 class="text-4xl font-bold">Login</h1>
        </div>

        <div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
            <form:form modelAttribute="requestLogin" class="card-body lg:px-[10%]">
                <form:errors />

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <form:input path="id" id="id" name="id" type="text" class="input input-bordered"/>
                    <div class="text-center"><form:errors path="id" /></div>
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <form:input type="password" path="pass" id="pass" name="pass" class="input input-bordered"/>
                    <div class="text-center"><form:errors path="pass" /></div>
                </div>

                <div class="form-control">
                    <label class="label cursor-pointer">
                        <span class="label-text">아이디 기억하기</span>
                        <input type="checkbox" id="rememberId" name="rememberId" class="checkbox checkbox-secondary">
                    </label>
                </div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary text-gray-600 hover:text-white">Login</button>
                </div>

                <div class="form-control mt-1">
                    <a id="kakao-login-btn" href="javascript:loginWithKakao()" class="btn btn-accent text-gray-600 hover:text-black">Kakao Login</a>
                </div>

                <a href="/admin/login" class="text-center text-gray-400">Administrator Login</a>

                <a href="/findId" class="mt-3" >ID 찾기</a>
                <a href="/findPass" >비밀번호 찾기</a>
            </form:form>
        </div>

    </div>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">

        Kakao.init('e124f6da6ba825064e0e5ecf46e18d60');

        function loginWithKakao() {
            Kakao.Auth.login({
                success: function(authObj) {
                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function(res) {

                            let properties = res.properties;
                            let name = properties.nickname;
                            let thumbnailImage = properties.thumbnail_image;
                            let id = res.id;

                            $.ajax({
                                url: '<c:url value="/login/kakao"/>',
                                type: 'POST',
                                data: JSON.stringify({
                                    "name": name,
                                    "id": id,
                                    "thumbnailImage": thumbnailImage
                                }),
                                dataType: "json",
                                contentType: 'application/json',
                                success: function(data) {
                                    console.log("성공")
                                    console.log(data);
                                    window.location.replace('/')

                                }, error: function(){
                                    console.log("에러");
                                    window.location.replace('login')
                                }
                            })
                        },
                        fail: function(error) {
                            alert(
                                'login success, but failed to request user information: ' +
                                JSON.stringify(error)
                            )
                        },
                    })
                },
                fail: function(err) {
                    alert(JSON.stringify(err))
                },
            })
        }
    </script>
</section>

<%@ include file="../common/footer.jsp" %>
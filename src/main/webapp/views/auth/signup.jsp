<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../common/header.jsp" %>

<section class="container mx-auto">
    <div class="flex flex-col mx-auto lg:mx-[30%] min-h-screen justify-center">
        <div class="text-center mb-[0.7rem]">
            <h1 class="text-4xl font-bold">Sign Up</h1>
        </div>
        <div class="card flex-shrink-0 w-full shadow-2xl bg-base-100">
            <form:form modelAttribute="requestSignup" class="card-body lg:px-[10%]">
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Name</span>
                    </label>
                    <form:input type="text" path="name" id="name" name="name" limitbyte="50" placeholder="한글 6자, 영문50자 이내" class="input input-bordered" onKeyUp="javascript:fnChkByte(this,'50','byteInfo')"/>
                    <span style="display: inline-block; width: 95%; text-align: right; font-size: 0.8rem;"><span id="byteInfo">0</span> / 50bytes</span>
                    <form:errors path="name" />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">ID</span>
                    </label>
                    <form:input type="text" path="id" id="id" name="id" limitbyte="100" placeholder="한글 33자, 영문100자 이내" class="input input-bordered" onKeyUp="javascript:fnChkByte(this,'100','byteInfo2')"/>
                    <span style="display: inline-block; width: 95%; text-align: right; font-size: 0.8rem;"><span id="byteInfo2">0</span> / 100bytes</span>
                    <form:errors path="id" />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Password</span>
                    </label>
                    <form:input type="password" path="pass" id="pass" name="pass" limitbyte="200" placeholder="한글 66자, 영문200자 이내" class="input input-bordered" onKeyUp="javascript:fnChkByte(this,'200','byteInfo3')"/>
                    <span style="display: inline-block; width: 95%; text-align: right; font-size: 0.8rem;"><span id="byteInfo3">0</span> / 200bytes</span>
                    <form:errors path="pass" />
                </div>

                <div class="form-control">
                    <label class="label">
                        <span class="label-text">Email</span>
                    </label>
                    <form:input type="email" path="email" id="email" name="email" class="input input-bordered"/>
                    <form:errors path="email" />
                </div>

                <div class="form-control mt-6">
                    <button class="btn btn-primary">Kakao Login</button>
                </div>

                <div class="form-control mt-1">
                    <button type="submit" class="btn btn-secondary">Sign Up</button>
                </div>
                <label class="text-center"><form:errors path="commonError"/></label>
                <a href="/adimSignup" class="text-center hover:text-[1.2rem]">Administrator SignUp</a>
            </form:form>
        </div>
    </div>

    <script type="text/javascript">
        function fnChkByte(obj, maxByte, id) {
            var str = obj.value;
            var str_len = str.length;
            var input = document.getElementById(id);
            var rbyte = 0;
            var rlen = 0;
            var one_char = "";
            var str2 = "";
            for (var i = 0; i < str_len; i++) {
                one_char = str.charAt(i);
                if (escape(one_char).length > 4) {
                    rbyte += 3; //한글3Byte
                } else {
                    rbyte++; //영문 등 나머지 1Byte
                }
                if (rbyte <= maxByte) {
                    rlen = i + 1; //return할 문자열 갯수
                }
            }
            if (rbyte > maxByte) {
                // alert("한글 "+(maxByte/3)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
                alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
                str2 = str.substr(0, rlen); //문자열 자르기
                obj.value = str2;
                fnChkByte(obj, maxByte);
            } else {
                input.innerText = rbyte;
            }
        }
    </script>
</section>

<%@ include file="../common/footer.jsp" %>
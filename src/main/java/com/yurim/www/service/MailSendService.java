package com.yurim.www.service;

import com.yurim.www.dto.UserDTO;
import com.yurim.www.repository.UserDAO;
import com.yurim.www.util.MailUtils;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class MailSendService {
	private final UserDAO userDAO;

	@Value("8080")
	private String port;

	//회뤈가입 인증 이메일 발송
	public String sendAuthMail(String email) {
		String authKey = getAuthCode(6);

		try {
			MailUtils sendMail = new MailUtils();
			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>").append("<h2>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</h2>")
					.append("<a href='http://www.biblet.site/signup/emailCheck?email=".formatted(port)).append(email)
					.append("&authKey=").append(authKey).append("' target='_blank'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("dbflarla496695@gmail.com", "관리자");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return authKey;
	}

	//비밀번호 찾기 이메일 발송
	public boolean sendAuthMailForFindPass(String email, String id){

		UserDTO user = userDAO.selectUserInfoById(id);

		if(user == null){
			return false;
		}

		try {
			MailUtils sendMail = new MailUtils();
			sendMail.setSubject("BiBlet 비밀번호 확인");
			sendMail.setText(new StringBuffer().append("<h2>" + user.getName() + "님의 비밀번호가 확인되었습니다.</h2>")
					.append("<h3>Password : " + user.getPass() + "</h3>")
					.toString());
			sendMail.setFrom("dbflarla496695@gmail.com", "관리자");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return true;
	}

	//관리자 가입 인증 이메일 발송
	public String sendAdmAuthMail(String email) {
		String authKey = getAuthCode(6);

		try {

			MailUtils sendMail = new MailUtils();
			sendMail.setSubject("관리자가입 이메일 인증");
			sendMail.setText(new StringBuffer()
					.append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://www.biblet.site/admin/confirm?adm_email=").append(email)
					.append("&adm_authKey=").append(authKey).append("' target='_blank'>이메일 인증 확인</a>")
					.toString());
			sendMail.setFrom("dbflarla496695@gmail.com", "관리자");
			sendMail.setTo(email);
			sendMail.send();

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return authKey;
	}

	//인증코드 생성
	private String getAuthCode(int size) {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}
}

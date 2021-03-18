package com.summer.cabbage.util;

import org.apache.commons.mail.HtmlEmail;

import com.summer.cabbage.vo.Member;

public class SendEmailUtil {

	public static void sendEmail(Member member, String div) {
		
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "wlsgus2401@gmail.com";
		String hostSMTPpwd = "gybwzqwfvmwmbycf";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = member.getId();
		String fromName = "cabbage";
		String subject = "";
		String msg = "";
		
		if(div.equals("findpw")) {
			subject = "변경된 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getId() + "님의 변경된 비밀번호 입니다.</h3>";
			msg += "<p>변경된 비밀번호 : ";
			msg += member.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		
		String mail = member.getId();
		
		System.out.println(mail.substring(mail.lastIndexOf("@")+1,mail.lastIndexOf(".")+1));
		
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);
			/*
			 * if(mail.substring(mail.lastIndexOf("@")+1,mail.lastIndexOf(".")).equals(
			 * "naver")){ email.setSmtpPort(587); //네이버 이용시 587 }else {
			 * email.setSmtpPort(465); }
			 */
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
}

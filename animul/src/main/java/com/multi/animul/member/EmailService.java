package com.multi.animul.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {
    private JavaMailSenderImpl mailSender;

    @Autowired
	public EmailService(JavaMailSender mailSender) {
		this.mailSender = (JavaMailSenderImpl) mailSender;
	}
    
    public int makeRandomNumber() {
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        
        return checkNum;
    }
    
    public void sendEmail(String from, String to, String subject, String body) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");

            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(body, true);

            mailSender.send(mimeMessage);
        } catch (MessagingException e) { e.printStackTrace(); }
    }

    public String joinEmail(String email) {
        int authNumber = makeRandomNumber();

        String from = "animul3306@gmail.com";
        String to = email;
        String subject = "Animul Membership Email Authentication Mail.";
        String content = 
                    "Thank you for visiting our site." + 
                    "<br><br>" +
                    "The email verification number: " + authNumber +
                    "<br>" +
                    "Please enter the authentication number in the box.";
                    
        sendEmail(from, to, subject, content);

        return Integer.toString(authNumber);
    }
} 

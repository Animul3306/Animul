package com.multi.animul.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmailController {
	@Autowired
	EmailService service;

    public EmailController(EmailService emailService) {
        this.service = emailService;
    }

    //  @GetMapping("/member/send-email.do")
    //  public String sendEmail2(String email) {
    //      System.out.println("�̸��� ���� ��û�� ����!");
    //      System.out.println("�̸��� ���� �̸���: " + email);

    //      return service.joinEmail(email);
    //  }

    
	@RequestMapping(value="/member/MailCheck.do", method=RequestMethod.GET)
    public ResponseEntity<String> sendEmail(@RequestParam("email") String email) {
        System.out.println("Email verification request received!");
        System.out.println("Email verification email: " + email);

        String result = service.joinEmail(email);
        
        return ResponseEntity.ok(result);
    }
}

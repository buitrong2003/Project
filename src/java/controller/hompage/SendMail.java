/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.hompage;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.*;

/**
 *
 * @author d
 */
public class SendMail {

    public void send(String to, String sub, String msg, String user, String pass) {
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", "587");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");

        // Tạo một phiên làm việc để gửi email
        Session session = Session.getInstance(p, new Authenticator() {
            @Override
            protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                return new jakarta.mail.PasswordAuthentication(user, pass);
            }
        });

        try {
            // Tạo đối tượng MimeMessage để thiết lập nội dung email
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            // Thiết lập tiêu đề
            message.setSubject(sub);
            // Thiết lập nội dung
            message.setText(msg, "text/html");
            // Gửi email
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String subject = "Hello anh em";
        String mess = "dfhbfgdhjgfhjghffgj";
        new SendMail().send("ductrongb89@gmail.com", subject, mess, "trongbdhe173121@fpt.edu.vn", "oxtvtfdgcachailu");
    }
}

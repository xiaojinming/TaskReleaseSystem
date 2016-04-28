package com.trs.util;
import java.util.List;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;


public class SendMail {


    public void send(String email,String url) throws AddressException, MessagingException
    {
        SimpleMailSender sms = new SimpleMailSender("tianxia00115@163.com","383160100033");
        String recipients = email;

        sms.send(recipients, "trs找回密码","尊敬的trs用户，为了找回您的密码，请在两分钟之内<a href='http://" + url + "'>点击</a> 如果不是您本人操作，请忽略此消息。");
    }



    public static void main(String[] args) throws AddressException, MessagingException{
        SimpleMailSender sms = new SimpleMailSender("tianxia00115@163.com","383160100033");
        ArrayList<String> recipients = new ArrayList<String>();
        recipients.add("2867870421@qq.com");

        for(String recipient:recipients){
            sms.send(recipients, "test测试","hello xjm.");
        }
    }
}

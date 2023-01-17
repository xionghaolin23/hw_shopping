package com.huawei.hw_shopping.config;

import com.baomidou.mybatisplus.core.incrementer.IKeyGenerator;
import com.baomidou.mybatisplus.extension.incrementer.OracleKeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * 邮件配置类
 */
@Configuration
public class Mailconfig {

    /**
     * @return 获取邮件发送实例
     */
    @Bean
    public MailSender mailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        //指定用来发送Emai的邮件服务器主机名
        mailSender.setHost("smtp.qq.com");
        //默认端口
        mailSender.setPort(587);
        //设置用户名
        mailSender.setUsername("xionghl23@foxmail.com");
        mailSender.setPassword("ktogceawxwxybagd");
        return mailSender;
    }

    /**使用配置类 是oracle生成主键策略
     * @return
     */
    @Bean
    public IKeyGenerator keyGenerator() {
        return new OracleKeyGenerator();
    }
}

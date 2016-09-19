package ru.aktubselmash.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;
import ru.aktubselmash.model.Cart;

import javax.mail.internet.MimeMessage;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Yury
 * Date: 11.11.11
 * Time: 22:52
 * To change this template use File | Settings | File Templates.
 */
public class EmailService {
    private static final Log logger = LogFactory.getLog(EmailService.class);
    private static final DateFormat df = new SimpleDateFormat("w");

    private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
    private String infoEmail, homeEmail;

    public EmailService(String infoEmail, String homeEmail) {
        this.infoEmail = infoEmail;
        this.homeEmail = homeEmail;
    }

    public void sendConformationEmail(final Cart cart) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                message.setSubject("Ваш заказ №" + cart.getId() + "/" + df.format(new Date()) + " на Aktubselmash.ru");
                message.setTo(cart.getClient().getEmail());
                message.setFrom(infoEmail);
                Map<String, Object> model = new HashMap<String, Object>();
                model.put("cart", cart);
                model.put("number", new NumberTool());
                model.put("locale", new Locale("ru", "RU"));
                model.put("month", df.format(new Date()));
                String text = VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, "confirmation.vm", "UTF-8", model);
                message.setText(text, true);
            }
        };
        this.mailSender.send(preparator);
    }

    public void sendOrderEmail(final Cart cart) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
                message.setSubject("Новый заказ №" + cart.getId() + "/" + df.format(new Date()));
                message.setFrom(infoEmail);
                message.setTo(homeEmail);
                Map<String, Object> model = new HashMap<String, Object>();
                model.put("cart", cart);
                model.put("number", new NumberTool());
                model.put("locale", new Locale("ru", "RU"));
                model.put("month", df.format(new Date()));
                String text = VelocityEngineUtils.mergeTemplateIntoString(
                        velocityEngine, "order.vm", "UTF-8", model);
                message.setText(text, true);
            }
        };
        this.mailSender.send(preparator);
    }

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }
}

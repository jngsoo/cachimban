class CaribongbongmailMailer < ApplicationMailer
    def welcome_email title, content
        mail from: 'wt2933@icloud.com',
             to: 'wt2933@naver.com',
        subject: title,
        body: content
    end
end

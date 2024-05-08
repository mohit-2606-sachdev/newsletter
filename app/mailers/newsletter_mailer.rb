class NewsletterMailer < ApplicationMailer
    default from: 'no-reply@test.com'

    def send_newsletter(template)
        @template = template
        @subscribers = Subscriber.all

        @subscribers.each do |subscriber|
          if subscriber.subscribed?("email_blast")
            mail(to: subscriber.email, subject: @template.subject) do |format|
              format.html { render "send_newsletter", locals: { subscriber: subscriber } }
            end
          end
        end
  
      end

      def welcome_subscriber(user)
        @user = user
        mail(to: @user.email, subject: "Welcome to our Newsletter")
      end

      def unsubscribe(unsubscriber)
        @unsubscriber = unsubscriber
        mail(to: @unsubscriber.email, subject: 'Unsubscribe from Our Newsletter')
      end
end

class NewsletterMailer < ApplicationMailer
    default from: 'no-reply@test.com'

    def send_newsletter
        @subscribers = Subscriber.all
    
        users = []  # Create an empty array to store subscribed users
    
        @subscribers.each do |subscriber|
          if subscriber.subscribed?("email_blast")
            users << subscriber
          end
        end
    
        mail(to: users.pluck(:email), subject: "Dummy Email")
      end
end

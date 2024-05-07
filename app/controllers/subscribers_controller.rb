class SubscribersController < ApplicationController
    def subscribe
        @subscriber = Subscriber.new(email: params[:email])
        if @subscriber.save
            @newsletter = Newsletterlist.find_by(name:"email_blast")
            @subscriber.subscribe(@newsletter.name)
            render json: { message: "Subscribed successfully" }
        else
            render json: { message: "Something went wrong please try again!! " }
        end
    end

    def unsubscribe
        @unsubscriber = Subscriber.find(params[:id])
        @newsletter = Newsletterlist.find_by(name:"email_blast")
        @unsubscriber.unsubscribe(@newsletter.name)
        if @unsubscriber.delete
            render json: { message: "Unsubscribed successfully" }
        else
            render json: { message: "Something went wrong please try again!! " }
        end
    end

    def send_emails
        # @subscribers = mailkick_subscriptions.find_by(list:"email_blast")
        # Rails.logger.info = @subscribers
        NewsletterMailer.send_newsletter.deliver_now
    end
end

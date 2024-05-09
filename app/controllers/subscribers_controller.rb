class SubscribersController < ApplicationController
    def subscribe
        @subscriber = Subscriber.new(email: params[:email])
        if @subscriber.save
          NewsletterMailer.welcome_subscriber(@subscriber).deliver_now
          @subscriber.subscribe("email_blast")
          flash[:success] = "Subscribed successfully! Check your inbox for a confirmation email."
          redirect_to root_path
        else
          flash[:error] = @subscriber.errors[:email][0]
          redirect_to register_path
        end
      end

    def unsubscribe
        @unsubscriber = Subscriber.find(params[:id])
        @newsletter = Newsletterlist.find_by(name:"email_blast")
        @unsubscriber.unsubscribe(@newsletter.name)
        if @unsubscriber.delete
            NewsletterMailer.unsubscribe(@unsubscriber).deliver_now
            flash[:success] = "Unsubscribed successfully"
        else
            flash[:error] = "Something went wrong please try again!! "
        end
    end

    def new
        @subscriber = Subscriber.new
    end

    def send_email_for_subscription
    end

    def send_email
        NewsletterMailer.subscribe_link(params[:email]).deliver_now
    end
end

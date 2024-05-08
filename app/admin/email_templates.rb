ActiveAdmin.register EmailTemplate do
  permit_params :subject, :description

  form do |f|
    f.inputs "Email Template Details" do
      f.input :subject
      f.input :description, as: :text
    end
    f.actions
  end

  controller do
    def create
      @template = EmailTemplate.new(permitted_params[:email_template])
      if @template.valid?
        result = NewsletterMailer.send_newsletter(@template).deliver_now
        if result
          @template.save
          flash[:success] = "Email template created successfully!"
          redirect_to admin_email_template_path(@template)
        else
          flash[:error] = "Failed to send email. Please try again later."
          render :new
        end
      else
        render :new
      end
    end
  end
  
end

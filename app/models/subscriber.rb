class Subscriber < ApplicationRecord
    has_subscriptions
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    before_save :downcase_email

    private
  
    def downcase_email
      self.email.downcase! if email.present?
    end

end

class EmailTemplate < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "subject", "updated_at"]
      end
end

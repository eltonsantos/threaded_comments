class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Get current_user
  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
  
end

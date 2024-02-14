class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_create :assign_id

  def assign_id
    self.id = SecureRandom.uuid if self.id.blank?
  end
end

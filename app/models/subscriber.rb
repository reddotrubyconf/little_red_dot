# frozen_string_literal: true

class Subscriber < ApplicationRecord
  belongs_to :conference

  validates :email, format: { with: Devise.email_regexp }
end

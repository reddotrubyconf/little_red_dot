# frozen_string_literal: true

class Conference < ApplicationRecord
  has_many :papers, dependent: :destroy
  has_many :subscribers, dependent: :destroy
end

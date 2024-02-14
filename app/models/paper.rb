# frozen_string_literal: true

class Paper < ApplicationRecord
  AUDIENCE_LEVELS = %w[all beginner intermediate advanced].freeze

  belongs_to :conference
  belongs_to :user

  has_one :speaker_profile, dependent: :destroy
  accepts_nested_attributes_for :speaker_profile

  validates :audience_level, inclusion: { in: AUDIENCE_LEVELS }
  validates :title, :description, presence: true, allow_blank: false
end

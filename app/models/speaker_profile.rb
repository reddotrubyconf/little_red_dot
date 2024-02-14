# frozen_string_literal: true

class SpeakerProfile < ApplicationRecord
  belongs_to :paper

  delegate :user, to: :paper

  validates :name, :affiliation, :bio, presence: true, allow_blank: false
end

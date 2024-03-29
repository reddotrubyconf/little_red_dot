class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:github]

  has_many :papers
  has_many :speaker_profiles, through: :papers

  def self.from_omniauth(auth)
    where(provider: auth.provider, source_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.data['username'] = auth.info.nickname
    end
  end

  def username
    data['username']
  end

  def github_display_picture_url
    profile = data['username'] || "rubysg"

    "https://github.com/#{profile}.png"
  end
end

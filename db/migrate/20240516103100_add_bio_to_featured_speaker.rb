class AddBioToFeaturedSpeaker < ActiveRecord::Migration[7.0]
  def change
    add_column :featured_speakers, :bio, :text
  end
end

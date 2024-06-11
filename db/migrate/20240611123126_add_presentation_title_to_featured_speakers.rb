class AddPresentationTitleToFeaturedSpeakers < ActiveRecord::Migration[7.0]
  def change
    add_column :featured_speakers, :presentation_title, :string
  end
end

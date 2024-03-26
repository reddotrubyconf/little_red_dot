class CreateFeaturedSpeakers < ActiveRecord::Migration[7.0]
  def change
    create_table :featured_speakers, id: :string do |t|
      t.string :display_picture, null: false
      t.string :name, null: false
      t.string :title, null: false
      t.integer :display_order
      t.string :github_handle
      t.timestamps
    end
  end
end

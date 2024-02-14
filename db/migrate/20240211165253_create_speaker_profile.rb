class CreateSpeakerProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :speaker_profiles, id: :string do |t|
      t.string :name, null: false
      t.string :url
      t.string :affiliation
      t.text :bio
      t.string :x_handle

      t.references :paper, type: :string, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end

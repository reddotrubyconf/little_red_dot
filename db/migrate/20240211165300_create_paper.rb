class CreatePaper < ActiveRecord::Migration[7.0]
  def change
    create_table :papers, id: :string do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :notes

      t.string :audience_level, null: false

      t.string :status

      t.references :user, type: :string, foreign_key: true, index: true, null: false
      t.references :conference, type: :string, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end

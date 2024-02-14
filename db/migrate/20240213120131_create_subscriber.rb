class CreateSubscriber < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers, id: :string do |t|
      t.string :email, null: false
      t.references :conference, type: :string, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end

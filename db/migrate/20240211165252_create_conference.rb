class CreateConference < ActiveRecord::Migration[7.0]
  def change
    create_table :conferences, id: :string do |t|
      t.string :name, null: false
      t.string :address
      t.datetime :start_date
      t.datetime :end_date
      t.json :agenda, default: {}
      t.boolean :active, default: false
      t.boolean :call_for_papers, default: false

      t.timestamps
    end
  end
end

class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks do |t|
      t.string :source
      t.string :event_name
      t.json :payload

      t.timestamps
    end
  end
end

class CreateIncomingWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :incoming_webhooks, id: :string do |t|
      t.string :source
      t.string :event_name
      t.json :payload

      t.timestamps
    end
  end
end

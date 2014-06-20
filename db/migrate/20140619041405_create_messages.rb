class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer     :conversation_id, null: false
      t.integer     :sender_id, null: false
      t.integer     :recipient_id, null: false
      t.datetime    :received_at
      t.datetime    :sent_at
      t.text        :text_value
      t.text        :html_value

      t.timestamps
    end
  end
end

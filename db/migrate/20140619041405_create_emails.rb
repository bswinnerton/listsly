class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :conversation_id, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.text    :text_value
      t.text    :html_value

      t.timestamps
    end
  end
end

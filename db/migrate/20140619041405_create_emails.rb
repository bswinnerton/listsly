class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.integer :recipient_id
      t.text    :text_value
      t.text    :html_value

      t.timestamps
    end
  end
end

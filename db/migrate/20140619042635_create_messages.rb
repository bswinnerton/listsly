class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end

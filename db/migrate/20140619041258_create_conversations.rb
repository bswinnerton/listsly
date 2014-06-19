class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :user_id
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end

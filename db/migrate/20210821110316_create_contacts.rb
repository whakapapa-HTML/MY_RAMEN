class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.text :reply
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end

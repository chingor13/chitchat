class InitialSchema < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :identifier, null: false
      t.boolean :available, null: false, default: false
      t.timestamps null: false
    end

    create_table :chats do |t|
      t.integer :from_id, null: false
      t.integer :to_id, null: false
      t.string :status, null: false, default: "closed"
      t.timestamps null: false
    end

    create_table :messages do |t|
      t.integer :user_id, null: false
      t.integer :chat_id, null: false
      t.text :body, null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :messages
    drop_table :chats
    drop_table :users
  end
end

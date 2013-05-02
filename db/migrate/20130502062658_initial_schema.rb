class InitialSchema < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :identifier
      t.boolean :available
      t.timestamps
    end

    create_table :calls do |t|
      t.integer :from_id, :null => false
      t.integer :to_id, :null => false
      t.timestamps
    end

    create_table :messages do |t|
      t.integer :user_id, :null => false
      t.integer :call_id, :null => false
      t.text :body
      t.timestamps
    end
  end

  def down
    drop_table :messages
    drop_table :calls
    drop_table :users
  end
end

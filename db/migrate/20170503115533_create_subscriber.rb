class CreateSubscriber < ActiveRecord::Migration
  def up
    create_table :subscribers do |t|
      t.string  :endpoint, null: false
      t.string  :p256dh
      t.string  :auth
      t.integer :timestamp
    end
  end

  def down
    drop_table :subscribers
  end
end

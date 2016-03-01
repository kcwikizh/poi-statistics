class CreateKvData < ActiveRecord::Migration
  def up
    create_table :kv_data do |t|
      t.string :key,   null: false
      t.string :value, null: false
    end
    add_index :kv_data, :key
  end

  def down
    drop_table :kv_data
  end
end

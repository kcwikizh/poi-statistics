class CreateDevelopmentRecord < ActiveRecord::Migration
  def up
    create_table :development_records do |t|
      t.string  :name,      null: false
      t.integer :item,      null: false
      t.integer :cost,      null: false, array: true
      t.integer :time_no,   null: false
      t.boolean :success,   null: false
      t.integer :count,     null: false
      t.json    :secretary
      t.json    :hq_lv
      t.json    :origin
    end
    add_index :development_records, :name
    add_index :development_records, :item
    add_index :development_records, :cost, using: :gin
    add_index :development_records, :time_no
  end

  def down
    drop_table :development_records
  end
end

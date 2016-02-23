class CreateDevelopmentRecord < ActiveRecord::Migration
  def up
    create_table :development_records do |t|
      t.string  :name,      null: false, default: ""
      t.integer :item,      null: false, default: 0
      t.integer :cost,      null: false, default: [0, 0, 0, 0], array: true
      t.integer :time_no,   null: false, default: 0
      t.boolean :success,   null: false, default: false
      t.integer :count,     null: false, default: 0
      t.json    :secretary, null: false, default: {}
      t.json    :hq_lv,     null: false, default: {}
      t.json    :origin,    null: false, default: {}
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

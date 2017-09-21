class CreateConstructionRecord < ActiveRecord::Migration[5.1]
  def up
    create_table :construction_records do |t|
      t.integer :ship,      null: false, default: 0
      t.integer :cost,      null: false, default: [0, 0, 0, 0, 0], array: true
      t.integer :time_no,   null: false, default: 0
      t.integer :count,     null: false, default: 0
      t.json    :kdock,     null: false, default: {}
      t.json    :secretary, null: false, default: {}
      t.json    :hq_lv,     null: false, default: {}
      t.json    :origin,    null: false, default: {}
    end
    add_index :construction_records, :ship
    add_index :construction_records, :cost, using: :gin
    add_index :construction_records, :time_no
  end

  def down
    drop_table :construction_records
  end
end

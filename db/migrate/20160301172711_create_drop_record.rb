class CreateDropRecord < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE battle_rank AS ENUM ('S', 'A', 'B', 'C', 'D', 'E');
    SQL

    create_table :drop_records do |t|
      t.string  :name,               null: false, default: ''
      t.integer :ship,               null: false, default: 0
      t.integer :map,                null: false, default: 0
      t.integer :cell,               null: false, default: 0
      t.integer :level,              null: false, default: 0
      t.column  :rank, :battle_rank, null: false, default: 'E'
      t.integer :time_no,            null: false, default: 0
      t.string  :enemy,              null: false, default: ''
      t.integer :count,              null: false, default: 0
      t.json    :hq_lv,              null: false, default: {}
      t.json    :origin,             null: false, default: {}
    end
    add_index :drop_records, :name
    add_index :drop_records, :ship
    add_index :drop_records, [:map, :cell, :level]
    add_index :drop_records, :rank    
    add_index :drop_records, :time_no
  end

  def down
    drop_table :drop_records
    
    execute <<-SQL
      DROP TYPE battle_rank
    SQL
  end
end

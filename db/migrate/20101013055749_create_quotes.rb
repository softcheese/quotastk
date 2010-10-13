class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.text :body
      t.integer :speaker_id
      t.string :context
      t.integer :channel_id
      t.datetime :date
      t.boolean :offensive
      t.boolean :spam

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end

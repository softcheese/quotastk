class CreateQuotesSpeakers < ActiveRecord::Migration
  def self.up
    create_table(:quotes_speakers, :id => false) do |t|
      t.integer :quote_id
      t.integer :speaker_id
    end
  end

  def self.down
    drop_table :quotes_speakers
  end
end

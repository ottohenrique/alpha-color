class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :word, null: false
      t.string :color, null: false
      t.integer :total, default: 0

      t.index [:word, :color], unique: true
      t.index :total

      t.timestamps
    end
  end
end

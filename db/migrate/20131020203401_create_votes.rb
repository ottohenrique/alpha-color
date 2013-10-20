class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :word
      t.string :color

      t.timestamps
    end
  end
end

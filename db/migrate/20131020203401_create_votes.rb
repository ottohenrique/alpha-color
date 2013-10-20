class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :word, index: true
      t.references :coloer, index: true

      t.timestamps
    end
  end
end

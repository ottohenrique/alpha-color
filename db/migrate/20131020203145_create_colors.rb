class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex, limit: 6

      t.timestamps
    end
  end
end

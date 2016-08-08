class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :quarter
      t.integer :year
      t.date :date

      t.timestamps null: false
    end
  end
end

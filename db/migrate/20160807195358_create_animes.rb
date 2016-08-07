class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :adala
      t.string :t441
      t.string :trailer
      t.string :step
      t.string :state
      t.string :season
      t.integer :rate
      t.date :release
      t.date :estimate

      t.timestamps null: false
    end
  end
end

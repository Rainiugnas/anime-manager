class AssociationBetweenRateAndAnime < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :value
      t.string :name
    end

    change_table :animes do |t|
      t.belongs_to :rate, index: true
    end
  end
end

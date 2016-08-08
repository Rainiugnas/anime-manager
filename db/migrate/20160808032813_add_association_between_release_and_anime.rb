class AddAssociationBetweenReleaseAndAnime < ActiveRecord::Migration
  def change
    create_table :animes_releases do |t|
      t.belongs_to :anime, index: true
      t.belongs_to :release, index: true
    end

    change_table :animes do |t|
      t.remove :release
    end
  end
end

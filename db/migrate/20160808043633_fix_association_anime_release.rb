class FixAssociationAnimeRelease < ActiveRecord::Migration
  def change
    drop_table :animes_releases

    change_table :animes do |t|
      t.belongs_to :release, index: true
    end
  end
end

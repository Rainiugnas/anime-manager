class ChangeColumnNameT441ToT411ToAnimes < ActiveRecord::Migration
  def change
    change_table :animes do |t|
      t.rename :t441, :t411
    end
  end
end

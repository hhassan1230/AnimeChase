class AddFloatToAnimes < ActiveRecord::Migration
  def change
  	change_column :animes, :score, :float
  end
end

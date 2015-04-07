class CreateGenreAnimes < ActiveRecord::Migration
  def change
    create_table :genre_animes do |t|
      t.integer :genre_id
      t.integer :anime_id

      t.timestamps null: false
    end
  end
end

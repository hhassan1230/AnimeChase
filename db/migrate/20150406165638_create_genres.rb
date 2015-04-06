class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :anime, index: true

      t.timestamps null: false
    end
    add_foreign_key :genres, :animes
  end
end

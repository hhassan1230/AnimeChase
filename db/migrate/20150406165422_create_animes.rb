class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :img_url
      t.integer :score

      t.timestamps null: false
    end
  end
end

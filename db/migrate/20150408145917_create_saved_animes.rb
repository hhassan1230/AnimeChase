class CreateSavedAnimes < ActiveRecord::Migration
  def change
    create_table :saved_animes do |t|
      t.integer :user_id
      t.integer :anime_id

      t.timestamps null: false
    end
  end
end

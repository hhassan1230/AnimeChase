class AddStatusToAnime < ActiveRecord::Migration
  def change
  	add_column :animes, :show_type, :string
  	add_column :animes, :starting_date, :date
  	add_column :animes, :end_date, :date
  	add_column :animes, :eps_length, :string
  	add_column :animes, :eps_count, :string
  	add_column :animes, :show_status, :string
  	add_column :animes, :age_rating, :string
  	add_column :animes, :humm_id, :integer


  end
end

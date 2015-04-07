class AddImgUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_img_url, :string
 
  end
end

class AddUrlImgToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :url_img, :string
  end
end

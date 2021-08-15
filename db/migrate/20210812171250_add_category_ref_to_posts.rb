class AddCategoryRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :category, null: true
  end
end

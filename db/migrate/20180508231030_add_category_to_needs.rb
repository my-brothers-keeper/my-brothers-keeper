class AddCategoryToNeeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :needs, :category, foreign_key: true
  end
end

class AddRatingsToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :rating, :string)
  end
end

class ChangeRatingsColumnToRatingInRecipes < ActiveRecord::Migration[5.1]
  def change
    change_table(:recipes) do |t|
      t.rename :ratings, :rating
    end
  end
end

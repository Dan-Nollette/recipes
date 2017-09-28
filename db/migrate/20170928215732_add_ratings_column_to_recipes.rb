class AddRatingsColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    change_table(:recipes) do |t|
      t.column :ratings, :integer
    end
  end
end

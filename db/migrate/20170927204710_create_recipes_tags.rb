class CreateRecipesTags < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes_tags) do |t|
      t.column(:recipes_id, :int)
      t.column(:tags_id, :int)
      t.timestamps()
    end
  end
end

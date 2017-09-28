class ChangeRecipesTagsColumnNames < ActiveRecord::Migration[5.1]
  def change
    change_table(:recipes_tags) do |t|
      t.rename :recipes_id, :recipe_id
      t.rename :tags_id, :tag_id
    end
  end
end

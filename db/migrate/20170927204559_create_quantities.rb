class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table(:quantities) do |t|
      t.column(:ingredient_id, :int)
      t.column(:recipe_id, :int)
      t.column(:unit, :string)
      t.column(:number, :int)
      t.timestamps()
    end
  end
end

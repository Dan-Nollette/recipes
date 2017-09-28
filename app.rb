require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @recipes = Recipe.all
  erb(:index)
end

get("/tag") do
  @tags = Tag.all
  erb(:tag)
end

get("/ingredient") do
  @ingredients = Ingredient.all
  erb(:ingredient)
end

post("/ingredient") do
  Ingredient.create({:name => params.fetch("name")})
  redirect "/ingredient"
end

post("/tag") do
  Tag.create({:name => params.fetch("name")})
  redirect "/tag"
end

get("/recipes") do
  @recipes = Recipe.all
  unless @recipes.any?
    redirect "/recipes/new"
  end
  erb(:recipes)
end

get '/recipes/new' do
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:new_recipe)
end

post '/recipes/new' do
  ingredients = []
  tags = []
  params.each do |param|
    param_parts = param.first.split("_")
    if param_parts[0] == "ingredients"
      ingredients.push(param_parts[1].to_i)
    end
    if param_parts[0] == "tags"
      tags.push(param_parts[1].to_i)
    end
  end
  recipe = Recipe.create(name: params["Recipe_name"])
  ingredients.each do |ingredient_id|
    ingredient = Ingredient.find(ingredient_id)
    Quantity.create({ingredient_id: ingredient.id, recipe_id: recipe.id})
  end
  tags.each do |tag_id|
    tag = Tag.find(tag_id)
    recipe.tags.push(tag)
  end
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:new_recipe)
end

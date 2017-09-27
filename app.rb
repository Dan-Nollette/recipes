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
  puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  puts params
  @tags = Tag.all
  @ingredients = Ingredient.all
  erb(:new_recipe)
end

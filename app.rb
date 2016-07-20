require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

#########################
# tags
#########################
get('/tags') do
  @tags = Tag.all()
  erb(:tags)
end

post('/tags') do
  name = params['name']
  @tag = Tag.create({name: name})
  redirect("/tags")
end

get('/tags/:id') do
  @tag = Tag.find(params['id'])
  erb(:tag)
end

get('/tags/:id/edit') do
  @tag = Tag.find(params[:id])
  erb(:tag_edit)
end

patch('/tags/:id') do
  @tag = Tag.find(params[:id])
  name = params['name']
  @tag.update({name: name})
  redirect("/tags/#{@tag.id()}")
end

delete('/tags/:id') do
  @tag = Tag.find(params[:id])
  @tag.destroy()
  redirect('/tags')
end


#########################
# recipes
#########################
get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

get("/recipes/new") do
  erb(:recipe_form)
end

post('/recipes') do
  name = params['name']
  prep_time = params[:prep_time]
  cook_time = params[:cook_time]
  instructions = params[:instructions]
  @recipe = Recipe.create({name: name, prep_time: prep_time, cook_time: cook_time, instructions: instructions})
  redirect("/recipes")
end

get('/recipes/:id') do
  @recipe = Recipe.find(params['id'])
  erb(:recipe)
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params[:id])
  @tags = Tag.all()
  erb(:recipe_edit)
end

patch('/recipes/:id') do
  @recipe = Recipe.find(params[:id])
  @tags = Tag.all()
  name = params['name']
  prep_time = params[:prep_time]
  cook_time = params[:cook_time]
  instructions = params[:instructions]
  @tags.each() do |tag|
    tag_id = params["#{tag.id()}"]
    if tag_id
      tag = Tag.find((tag_id).to_i())
      @recipe.tags.push(tag)
    end
  end
  @recipe.update({name: name, prep_time: prep_time, cook_time: cook_time, instructions: instructions})
  redirect("/recipes/#{@recipe.id()}")
end

delete('/recipes/:id') do
  @recipe = Recipe.find(params[:id])
  @recipe.destroy()
  redirect('/recipes')
end

delete('/recipes/:recipe_id/tags/:tag_id') do
  @recipe = Recipe.find(params['recipe_id'])
  @tag = Tag.find(params['tag_id'])
  @recipe.tags.destroy(@tag)
  redirect("/recipes/#{@recipe.id()}")
end

#########################
# ingredients
#########################
get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredients') do
  name = params[:name]
  quantity = params[:quantity]
  portion_size = params[:portion_size]
  @ingredient = Ingredient.create({name: name, quantity: quantity, portion_size: portion_size})
  redirect("/ingredients")
end

get('/ingredients/:id') do
  @ingredient = Ingredient.find(params['id'])
  erb(:ingredient)
end

get('/ingredients/:id/edit') do
  @ingredient = Ingredient.find(params[:id])
  erb(:ingredient_edit)
end

patch('/ingredients/:id') do
  @ingredient = Ingredient.find(params[:id])
  name = params[:name]
  quantity = params[:quantity]
  portion_size = params[:portion_size]
  @ingredient.update({name: name, quantity: quantity, portion_size: portion_size})
  redirect("/ingredients/#{@ingredient.id()}")
end

delete('/ingredients/:id') do
  @ingredient = Ingredient.find(params[:id])
  @ingredient.destroy()
  redirect('/ingredients')
end

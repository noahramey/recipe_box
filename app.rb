require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + 'lib/*.rb'].each { |file| require file }


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


#########################
# recipes
#########################
get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

#########################
# ingredients
#########################
get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

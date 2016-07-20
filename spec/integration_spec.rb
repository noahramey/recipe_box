require('spec_helper')

describe("the tags path", {:type => :feature}) do
  it("should show the tags") do
    test_tag = Tag.create({name: "Dinner"})
    test_tag2 = Tag.create({name: "Breakfast"})
    test_tag3 = Tag.create({name: "Brinner"})
    visit('/tags')
    expect(page).to have_content("#{test_tag.name()}")
  end

  it('should show an individual tag') do
    test_tag = Tag.create({name: "Mexican"})
    visit("/tags/#{test_tag.id()}")
    expect(page).to have_content("#{test_tag.name()}")
  end

  it('should let you create a tag') do
    visit('/tags')
    fill_in('name', :with => 'Mexican')
    click_on('Create')
    expect(page).to have_content("Mexican")
  end

  it('should let you edit a tag name') do
    test_tag = Tag.create({name: "Mexican"})
    visit("/tags/#{test_tag.id()}")
    click_on("Edit")
    fill_in('name', :with => "Chinese")
    click_on("Edit Tag")
    expect(page).to have_content("Chinese")
  end
end

describe("the recipes path", {:type => :feature}) do
  it("should show the recipes") do
    test_recipe = Recipe.create({name: "Braised Pork Ribs", prep_time: "20 mins", cook_time: "3 hours", instructions: "Roast.  Sauce.  Consume"})
    test_recipe2 = Recipe.create({name: "Applesauce", prep_time: "20 mins", cook_time: "3 hours", instructions: "Roast.  Sauce.  Consume"})
    test_recipe3 = Recipe.create({name: "Eggs", prep_time: "20 mins", cook_time: "3 hours", instructions: "Roast.  Sauce.  Consume"})
    visit('/recipes')
    expect(page).to have_content("#{test_recipe.name()}")
  end

  it('should show an individual recipe') do
    test_recipe = Recipe.create({name: "Braised Pork Ribs", prep_time: "20 mins", cook_time: "3 hours", instructions: "Roast.  Sauce.  Consume"})
    visit("/recipes/#{test_recipe.id()}")
    expect(page).to have_content("#{test_recipe.name()}")
  end

  it('should let you create a recipe') do
    visit('/recipes/new')
    fill_in('name', :with => 'Braised Pork Ribs')
    fill_in('prep_time', :with => '20 min')
    fill_in('cook_time', :with => '3 hours')
    fill_in('instructions', :with => 'Roast.  Sauce.  Consume.')
    click_on('Create')
    expect(page).to have_content("Braised Pork Ribs")
  end

  it('should let you edit a recipe name') do
    test_recipe = Recipe.create({name: "Braised Pork Ribs", prep_time: "20 mins", cook_time: "3 hours", instructions: "Roast.  Sauce.  Consume"})
    visit("/recipes/#{test_recipe.id()}")
    click_on("Edit")
    fill_in('name', :with => "Duck Breast")
    fill_in('prep_time', :with => '20 min')
    fill_in('cook_time', :with => '3 hours')
    fill_in('instructions', :with => 'Roast.  Sauce.  Consume.')
    click_on("Edit Recipe")
    expect(page).to have_content("Duck Breast")
  end
end

describe("the ingredients path", {:type => :feature}) do
  it("should show the ingredients") do
    test_ingredient = Ingredient.create({name: "Red Pepper", quantity: "2", portion_size: "cups"})
    test_ingredient2 = Ingredient.create({name: "Green Pepper", quantity: "2", portion_size: "cups"})
    test_ingredient3 = Ingredient.create({name: "Yellow Pepper", quantity: "2", portion_size: "cups"})
    visit('/ingredients')
    expect(page).to have_content("#{test_ingredient.name()}")
  end

  it('should show an individual ingredient') do
    test_ingredient = Ingredient.create({name: "Red Pepper", quantity: "2", portion_size: "cups"})
    visit("/ingredients/#{test_ingredient.id()}")
    expect(page).to have_content("#{test_ingredient.name()}")
  end

  it('should let you create a ingredient') do
    visit('/ingredients')
    fill_in('name', :with => "Red Pepper")
    fill_in('quantity', :with => '2')
    fill_in('portion_size', :with => 'cups')
    click_on('Create')
    expect(page).to have_content("Red Pepper")
  end

  it('should let you edit a ingredient name') do
    test_ingredient = Ingredient.create({name: "Red Pepper", quantity: "2", portion_size: "cups"})
    visit("/ingredients/#{test_ingredient.id()}")
    click_on("Edit")
    fill_in('name', :with => "Green Pepper")
    fill_in('quantity', :with => '3')
    fill_in('portion_size', :with => 'cups')
    click_on("Edit Ingredient")
    expect(page).to have_content("Green Pepper")
  end
end

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

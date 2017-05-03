require "int_helper_spec.rb"


describe("the root path", {:type => :feature}) do
  it("verifies a list of all trains, and a list of all cities") do
    visit("/")
    expect(page).to have_content("Portland")
    expect(page).to have_content("The Burf Express")
  end

  it("Creates a new train") do
    visit("/")
    fill_in('train', :with => 'The Pearly Goose')
    click_button("Add train")
    expect(page).to have_content("The Pearly Goose")
  end

  it("Creates a new city") do
    visit("/")
    fill_in('city', :with => 'Seattle')
    click_button("Add city")
    expect(page).to have_content("Seattle")
  end

  it("clicks on a train and goes to a single train page") do
    visit("/")
    click_link("The Burf Express")
    expect(page).to have_content("The Burf Express")
  end

  it("clicks on a city and goes to a single city page") do
    visit("/")
    click_link("Portland")
    expect(page).to have_content("City: Portland")
  end
end

describe("the train path", {:type => :feature}) do
  it("routes to the edit page") do
    visit("/")
    click_link("The Burf Express")
    click_link("Edit train")
    expect(page).to have_content("Edit train: The Burf Express")
  end
end

describe("the city path", {:type => :feature}) do
  it("routes to the edit page") do
    visit("/")
    click_link("Portland")
    click_link("Edit city")
    expect(page).to have_content("Edit city: Portland")
  end
end

# describe("the root path", {:type => :feature}) do
#   it("verifies a list of all trains, and a list of all cities") do
#     visit("/")
#     fill_in("word", :with => "Banana")
#     fill_in("definition", :with => "A delicious fruit")
#     click_button("Add")
#     expect(page).to have_content("Banana")
#   end
# end

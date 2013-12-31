require 'spec_helper'

feature 'Users can recieve an inventory', %q{
    As a food service employee
    I want to receive inventory
    So that it can be recorded that we have food items
} do
# I must specify a title, description, and quantity of the food item
# If I do not specify the required information, I am prompted to fix errors and to resubmit
# If I specify the required information, my inventory entry is recorded.

  it 'can reach the page showing inventories' do
    visit '/inventories'
    expect(page).to have_content('Total Inventories')
  end

  it 'can make a new inventory' do
    visit '/inventories/new'

    fill_in "Title", with: "Oranges"
    fill_in "Description", with: "Yummy florida oranges"
    fill_in "Quantity", with: "4"
    click_on "Submit Inventory"

    expect(Inventory.all.count).to eql(1)
    expect(page).to have_content('Oranges')
  end

  it 'does not save the inventory if there are fields missing' do
    visit '/inventories/new'
    click_on "Submit Inventory"
    expect(page).to have_content("can't be blank")

    expect(Inventory.all.count).to eql(0)
  end

  it 'saves after you add fields' do
    visit '/inventories/new'
    click_on "Submit Inventory"
    fill_in "Title", with: "Oranges"
    fill_in "Description", with: "Yummy florida oranges"
    fill_in "Quantity", with: "4"
    click_on "Submit Inventory"

    expect(Inventory.all.count).to eql(1)
    expect(page).to have_content('Oranges')
  end

  it 'shows multiple inventories on the index page' do
    thing1 =FactoryGirl.create(:inventory)
    thing2 =FactoryGirl.create(:inventory)
    thing3 =FactoryGirl.create(:inventory)

    visit '/inventories'
    expect(page).to have_content(thing2.title)
    expect(page).to have_content(thing3.title)

  end
end

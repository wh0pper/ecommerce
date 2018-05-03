require 'rails_helper'


describe "the process of adding a product to the cart" do
  before :each do
    product = FactoryBot.create(:product)
  end

  it "does that" do
    visit root_path
    fill_in "line_item_quantity", with: 3
    click_button "+"
    click_link "shopping_cart"
    expect(page).to have_content("Test Product")
    expect(page).to have_content("29.97")
  end
end

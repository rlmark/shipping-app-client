require "rails_helper"

describe "the checkout process", :type => :feature do
  let!(:product) { create(:product) }

  it 'creates an order' do
    visit "/"
    expect(page).to have_content "Troll Doll"
    click_link "Troll Doll"
    expect(page.current_path).to eq "/products/troll-doll"
    expect(page).to have_content "Troll Doll"
    expect(page).to have_content "$1.00"
    click_button "Add to Cart"
    expect(page).to_have content "Cart (1)"
  end
end

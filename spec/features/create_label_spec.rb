require 'spec_helper'

feature 'Create label' do
  scenario "User sees the menu option" do
    visit root_url
    expect(find("#menu")).to have_content("Create label")
  end

  scenario "User creates a new label" do
    visit root_url
    find("#menu").click_on("Create label")
    expect(current_path).to eq(new_label_path)
    fill_in("New Label", with: "Pizza")
    VCR.use_cassette('new_label') do
      click_on("Create")
    end
    expect(current_path).to eq(labels_path)
    expect(page).to have_content("Pizza")
  end

  scenario "User creates a duplicate label" do
    visit new_label_path
    fill_in("New Label", with: "Example")
    VCR.use_cassette('duplicate_label') do
      click_on("Create")
    end
    expect(current_path).to eq(labels_path)
    expect(page).to have_content("name is taken")
  end
end

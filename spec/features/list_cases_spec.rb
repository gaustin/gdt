require 'spec_helper'

feature "List cases" do
  scenario "User sees menu option" do
    visit root_url
    expect(find("#menu")).to have_content("List cases in first filter")
  end

  scenario "User displays cases" do
    visit root_url
    find("#menu").click_on("List cases in first filter")
    expect(find("#cases_list")).to have_css('li', count: 3)
  end
end

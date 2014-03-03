require 'spec_helper'

feature "List labels" do
  scenario "User sees menu option" do
    visit root_url
    expect(find("#menu")).to have_content("List labels")
  end

  scenario "User displays labels" do
    visit root_url
    VCR.use_cassette("labels") do
      find("#menu").click_on("List labels")
    end
    expect(find("#labels_list")).to have_css('li', count: 7)
  end
end

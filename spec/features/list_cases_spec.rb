require 'spec_helper'

feature "List cases" do
  scenario "User sees menu option" do
    visit root_url
    expect(find("#menu")).to have_content("List cases in first filter")
  end

  scenario "User displays cases" do
    visit root_url
    VCR.use_cassette("filters_and_cases") do
      find("#menu").click_on("List cases in first filter")
    end
    expect(find("#cases_list")).to have_css('tbody tr', count: 3)
  end

  scenario "User appends a label to a case" do
    VCR.use_cassette("append_case_label") do
      target_case = Desk::Filters.retrieve.first.cases.first
      visit cases_path
      handle = "#case-#{target_case.id}"
      within(handle) do
        select("Pizza", from: "label")
        click_on("Append")
      end
      expect(find("#{handle}-labels")).to have_content("Pizza")
    end
  end

  scenario "User clears labels on a case" do
    VCR.use_cassette("clear_all_case_labels") do
      target_case = Desk::Filters.retrieve.first.cases.first
      visit cases_path
      handle = "#case-#{target_case.id}"
      within(handle) do
        click_on("Clear")
      end
      expect(find("#{handle}-labels").text).to eq("")
    end
  end
end

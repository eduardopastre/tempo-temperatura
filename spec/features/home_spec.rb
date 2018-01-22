require 'rails_helper'

describe "Testing the home page", :type => :feature do
  it "loading home page" do
    visit "/"

    expect(page.status_code).to be(200)
  end
end
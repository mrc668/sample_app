require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

#
# Home
#
  describe "Home Page" do
    let(:myurl) {"/static_pages/home"}

    it "should have the content 'Sample App'" do
      visit "#{myurl}"

      expect(page).to have_content('Sample App')
    end

    it "should have the title base title" do
      visit "#{myurl}"

      expect(page).to have_title("#{base_title}")
    end

    it "should not have the title base title" do
      visit "#{myurl}"

      expect(page).not_to have_title("#{base_title} | Home")
    end

  end # Home

#
# Help 
#
  describe "Help Page" do
    let(:myurl) {"/static_pages/help"}

    it "should have the content 'Help'" do
      visit "#{myurl}"

      expect(page).to have_content('Help')
    end

    it "should have a title base_title | Help" do
      visit "#{myurl}"

      expect(page).to have_title("#{base_title} | Help")
    end

  end # Help

#
# About Us
#
  describe "About Us Page" do
    let(:myurl) {"/static_pages/about"}

    it "should have the content 'About Us'" do
      visit "#{myurl}"

      expect(page).to have_content('About Us')
    end

    it "should have the title base_title | About Us" do
      visit "#{myurl}"

      expect(page).to have_title("#{base_title} | About Us")
    end

  end # about us

#
# Contact Us
#
  describe "Contact Us Page" do
    let(:myurl) {"/static_pages/contact"}

    it "should have the content 'Contact Us'" do
      visit "#{myurl}"

      expect(page).to have_content('Contact Us')
      expect(page).to have_content('306 581 5046')
      expect(page).to have_content('milton@calnek.com')
    end

    it "should have the title base_title | Contact Us" do
      visit "#{myurl}"

      expect(page).to have_title("#{base_title} | Contact Us")
    end

  end # Contact us

end # Static pages


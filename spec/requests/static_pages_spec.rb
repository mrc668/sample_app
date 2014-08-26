require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

#
# Home
#
  describe "Home Page" do
		before { visit root_path }

    it { should have_content('Sample App') }
    it { should have_title("#{base_title}") }
    it { should_not have_title("| Home") }

  end # Home

#
# Help 
#
  describe "Help Page" do
		before { visit help_path }

    it { should have_content('Help') }
    it { should have_title("#{base_title} | Help") }

  end # Help

#
# About Us
#
  describe "About Us Page" do
		before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title("#{base_title} | About Us") }

  end # about us

#
# Contact Us
#
  describe "Contact Us Page" do
		before { visit contact_path }

    it { should have_content('Contact Us') }
    it { should have_content('306 581 5046') }
    it { should have_content('milton@calnek.com') }
    it { should have_title("#{base_title} | Contact Us") }

  end # Contact us

end # Static pages


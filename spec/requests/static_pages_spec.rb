require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

	shared_examples_for "all static pages" do
    it { should have_title("#{base_title}") }
    it { should have_title(page_title) }
    it { should have_link('Home', href: root_path) }
    it { should have_selector('h1', text: heading) }
    it { should have_selector('footer') }
    it { should have_link('About', href: about_path) }
	end
	  

#
# Home
#
  describe "Home Page" do
		before { visit root_path }
		let(:heading) { "Sample App" }
		let(:page_title) { "" }

    it { should_not have_title("| Home") }
    it { should have_content('Sign Up Now') }
		it_should_behave_like "all static pages"

  end # Home

#
# Help 
#
  describe "Help Page" do
		before { visit help_path }
		let(:heading) { "Help" }
		let(:page_title) { "| Help" }

		it_should_behave_like "all static pages"
    it { should have_content('Rails Tutorial') }

  end # Help

#
# About Us
#
  describe "About Us Page" do
		before { visit about_path }
		let(:heading) { "About Us" }
		let(:page_title) { "| About Us" }

		it_should_behave_like "all static pages"
    it { should have_content('Rails Tutorial') }

  end # about us

#
# Contact Us
#
  describe "Contact Us Page" do
		before { visit contact_path }
		let(:heading) { "Contact Us" }
		let(:page_title) { "| Contact Us" }

		it_should_behave_like "all static pages"
    it { should have_content('Rails Tutorial') }

    it { should have_content('306 581 5046') }
    it { should_not have_content('milton@calnek.com') }

  end # Contact us

#
# Check Links
#
  it "should have the right links on the layout" do
	  visit root_path
		click_link "Home"
		expect(page).to have_title("#{base_title}")
		click_link "Contact"
		expect(page).to have_title("| Contact")
	end # Check links

end # Static pages


require 'spec_helper'

describe "UserPages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

	shared_examples_for "all pages" do
    it { should have_selector('li', text: 'Home') }
    it { should have_selector('h1', text: heading) }
    it { should have_title("#{base_title}") }
    it { should have_title(page_title) }
    it { should have_selector('a', text: 'About') }
	end
	  
  describe "Sign up page" do
		before { visit new_user_path }
		let(:heading) { "Sign Up" }
		let(:page_title) { "| Sign Up" }

		it_should_behave_like "all pages"
  end # Sign up

	describe "Profile page" do
	  let(:user) { FactoryGirl.create(:user) }
		let(:heading) { user.name }
		let(:page_title) { "| #{user.name}" }
		before { visit user_path(user) }

		it_should_behave_like "all pages"
		it { should have_content(user.name) }

	end # profile page
end # user pages


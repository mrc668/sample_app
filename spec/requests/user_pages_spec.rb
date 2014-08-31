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

	describe "sign up" do
	  before { visit signup_path }
		let(:submit) { "Create my account" }

		describe "with invalid information" do
		  it "should not create a user" do
			  expect { click_button submit }.not_to change(User, :oount)
			end # it
		end # invalid information

    describe "with valid information" do
		  before do
			  fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end # before

			it "should create a user" do
			  expect { click_button submit }.to change(User, :oount).by(1)
			end # it
		end # valid information

	end # sign up

	describe "Profile page" do
	  let(:user) { FactoryGirl.create(:user) }
		let(:heading) { user.name }
		let(:page_title) { "| #{user.name}" }
		before { visit user_path(user) }

		it_should_behave_like "all pages"
		it { should have_content(user.name) }

	end # profile page
end # user pages


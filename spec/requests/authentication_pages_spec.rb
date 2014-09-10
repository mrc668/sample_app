require 'spec_helper'


describe "AuthenticationPages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

	shared_examples_for "all pages" do
    it { should have_selector('li', text: 'Home') }
    it { should have_selector('h1', text: heading) }
    it { should have_title("#{base_title}") }
    it { should have_title(page_title) }
    it { should have_selector('footer') }
    it { should have_link('About', href: about_path) }
	end
	  
  describe "signin page" do
		before { visit signin_path }
		let(:heading) { "Sign In" }
		let(:page_title) { "| Sign In" }

		describe "with invalid info" do
		  before { click_button "Sign In" }

		  it_should_behave_like "all pages"
      it { should have_selector('form', text: 'Email') }
      it { should have_selector('label', text: 'Email') }
      it { should have_selector('div.alert.alert-error') }

			describe "after visiting another page" do
			  before { click_link "Home" }
				it { should_not have_selector('div.alert.alert-error') }
			end # next visit
		end # invalid info

		describe "with valid info" do
			let(:user) { FactoryGirl.create(:user) }
		  let(:page_title) { user.name }
		  before do 
        fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
			  click_button "Sign In" 
			end # before

		  it_should_behave_like "all pages"
      #it { should have_selector('div.alert.alert-error') }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In') }
      it { should_not have_link('Sign In') }
		end # invalid info
  end # sign in page
end #  Auth pages

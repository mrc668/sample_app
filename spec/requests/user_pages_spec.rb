require 'spec_helper'

describe "UserPages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
	subject { page }

  describe "Sign up page" do
		before { visit signup_path }
    it { should have_selector('li', text: 'Home') }
    it { should have_content('Sign Up') }
    it { should have_content('Rails Tutorial') }
    it { should have_title("#{base_title} | Sign Up") }
    it { should have_selector('a', text: 'About') }
  end # Sign up
end # user pages

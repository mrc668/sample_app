require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
	before { @user = User.new(name: "Test User", email: "test@example.com") }

	subject {@user}

	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should be_valid }

	describe "when name is not present" do
	  before {@user.name = " "}
		it { should_not be_valid }
	end # mt name

	describe "when email is not present" do
	  before {@user.email = " "}
		it { should_not be_valid }
	end # mt email

	describe "when name is too long" do
	  before {@user.name = "A" * 51}
		it { should_not be_valid }
	end # long name

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[
        user@foo,com user_at_foo.org example.user@foo.  dbl@at@foo.com foo@bar_.com
        foo@bar_baz.com foo@bar+baz.com milton!sysa!sysb!mailhub 
      ]
				#foo@bar..com
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end # invalid email addresses

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn foo@bar-.com]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end # valid email formats

  describe "when email is not unique" do
    before do
		  user_with_same_email = @user.dup
			user_with_same_email.save
		end # dup & save

		it { should_not be_valid }
  end # dup email
      
  describe "when email is not unique" do
    before do
		  user_with_same_email = @user.dup
			user_with_same_email.save
		end # dup & save

		it { should_not be_valid }
  end # dup email
      
end

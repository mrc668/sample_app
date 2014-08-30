require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
	before { @user = User.new(
	  name: "Test User", email: "test@example.com",
		password: "foobar", password_confirmation: "foobar"
	) }

	subject {@user}

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:authenticate) }
	it { should_not respond_to(:foo) }

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
        foo@bar_baz.com foo@bar+baz.com milton!sysa!sysb!mailhub foo@bar..com
      ]
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
		  user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end # dup, upcase & save

		it { should_not be_valid }
  end # dup email
      
  describe "when email is mixed case" do
		let (:mixed_case_email) { "Test@ExAmple.Com"  }

	  it "should be saved in lower case" do
		  @user.email = mixed_case_email
			@user.save
			expect( @user.reload.email ).to eq mixed_case_email.downcase
		end # save/restor/test email
  end # mixed case email
      
	describe "when password is not present" do
	  before { @user = User.new(
	    name: "Test User", email: "test@example.com",
		  password: " ", password_confirmation: " "
	  ) }
		it { should_not be_valid }
	end # mt password

	describe "when password does not match confirmation" do
	  before {@user.password_confirmation = "mismatch"}
		it { should_not be_valid }
	end # mismatch password

	describe "with a password that is too short" do
	  before {@user.password = "a" *5 } 
		it { should_not be_valid }
	end # too short

	describe "return value of authenticate" do
	  before {@user.save }
		let( :found_user) { User.find_by(email: @user.email) }
		
		describe "with a valid password" do
		 it { should eq found_user.authenticate(@user.password) }
		end # validate valid password.

		describe "with an invalid password" do
		  let(:user_for_invalid_password) { found_user.authenticate("invalid") }
			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
		end # fail to valdate invalid password.

	end # password validation

end

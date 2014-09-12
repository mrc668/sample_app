# Note that Session Helpers are available to views
# outside of their class?
module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
		self.current_user = user
	end # sign in

	def signed_in?
		!current_user.nil?
	end # signed in?

	def current_user=(user)
		@current_user = user
	end # current user=

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end # current user

	def sign_out
	  current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end # sign_out

end # module SessionsHelper

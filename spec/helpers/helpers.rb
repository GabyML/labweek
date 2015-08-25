module Helpers

	def sign_up(user)
		visit '/users/new'
		fill_in :email, with: user.email
		fill_in :username, with: user.username
		fill_in :password, with: user.password
		fill_in :password_confirmation, with: user.password_confirmation
		click_on 'Submit'
	end

	  def token_generator
	  	(0..20).map { (65 + rand(26)).chr }.join
	  end
end
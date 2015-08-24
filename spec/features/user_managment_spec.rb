require 'spec_helper'

feature 'Create user' do

	scenario 'A new user is created' do
		user = build :user
		expect{ sign_up(user)}.to change(User, :count).by(1)		
	end

end
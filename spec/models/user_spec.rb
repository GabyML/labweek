require './app/models/user'

describe 'user' do

	it 'creates a password token when required' do
		expect(token_generator).not_to be(nil)
	end
end
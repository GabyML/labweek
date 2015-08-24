FactoryGirl.define do

	factory :user do
		email 'some@email.com'
		username 'someone'
		password 'something'
		password_confirm 'something'
	end
end
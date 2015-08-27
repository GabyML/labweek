require './app/models/email_handler'

describe EmailHandler do

  let(:user) {double :user, password_token: '4nknnkfjej5j3j', email: "user@example.com" }
  let(:email_client) { double :email_client }
  subject { EmailHandler.new(user, email_client) }

  it "passes a recovery message to an email client" do
    expect(email_client).to receive(:send_message).with(
      to: user.email,
      message: "You have requested a password reset/ Follow this link to continue:
      http://www.queondavip.herokuapp.com/#{user.password_token}")
    subject.send_something
  end
end

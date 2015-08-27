class EmailHandler
  def initialize user, client
    @user = user
    @client = client
  end

  def send_something
    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
    "@api.mailgun.net/v3/app7011b045d8f54d40b446c0f08284cb16.mailgun.org/messages",
    :from => "Excited User <mailgun@app7011b045d8f54d40b446c0f08284cb16.mailgun.org>",
    :to => "#{@user.username} <#{@user.email}>",
    :subject => "Password reset 4 u",
    :text => "You have requested a password reset/ Follow this link to continue: http://queondavip.herokuapp.com/users/confirm_password_reset/#{@user.password_token}"
  end

end

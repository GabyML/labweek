class EmailHandler
  def initialize user, client
    @user = user
    @client = client
  end

  # def call
  #   @client.send_message

  #   ("https://api:key-99d039c5b7fb15d2daf788798677fa15:@api.mailgun.com/app/domains/app7011b045d8f54d40b446c0f08284cb16.mailgun.org", {to: @user.email, text: "You have requested a password reset/ Follow this link to continue:\n      http://www.queondavip.herokuapp.com/#{@user.password_token}"})
  # end

  def send_something
    RestClient.post "https://api:key-99d039c5b7fb15d2daf788798677fa15"\
      ":@api.mailgun.com/app/domains/app7011b045d8f54d40b446c0f08284cb16.mailgun.org",
      :from =>
      :to => @user.email,
      :text => "You have requested a password reset/ Follow this link to continue: http://www.queondavip.herokuapp.com/#{@user.password_token}"
  end
end
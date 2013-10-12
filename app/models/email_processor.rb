class EmailProcessor
  def self.process(email)
    @user = User.find_by_email(email.from)
    if @user
      @user.weights.create!({value: email.body, date: Time.now.strftime("%m/%d/%Y")})
    end
  end
end
class Signup
  include ActiveModel::Model

  attr_accessor(
    :login,
    :email,
    :account_name,
  )

  validates_presence_of :login
  validates_presence_of :email
  validates_presence_of :account_name

  def initialize(options={})
    super
    @user = User.new(login: login, email: email)
    @account = Account.new(name: account_name)
  end

  def user
    @user
  end

  def account
    @account
  end

  def save

    if @user.valid? && @account.valid?
      @user.save
      @account.save
    end
  end
end

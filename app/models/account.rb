class Account < ActiveRecord::Base
  has_many :users

  validates_presence_of :name
  validates_uniqueness_of :name

  class NullAccount
    def name
      ""
    end
  end

  def self.for_user(user)
    if user.account_id
      Account.find(user.account_id)
    else
      NullAccount.new
    end
  end
end

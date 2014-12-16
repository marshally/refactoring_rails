class User < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :login
  validates_presence_of :email
end

class User < ApplicationRecord
  has_one :account, dependent: :destroy
  after_create :init_account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def init_account
    self.create_account!
  end
end

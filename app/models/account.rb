class Account < ApplicationRecord
  has_many :orders, depedent: :destroy
  belongs_to :user
end

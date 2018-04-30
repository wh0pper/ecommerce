require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should have_many :orders }
  it { should belong_to :user }
end

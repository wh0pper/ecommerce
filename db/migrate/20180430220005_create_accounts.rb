class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, index: true
    end

    add_reference :orders, :account, index: true
  end
end

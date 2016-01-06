class AddPhoneAndDesignationToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :designation, :string
  end
end

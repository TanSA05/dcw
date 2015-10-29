class RemoveUserFromForward < ActiveRecord::Migration
  def change
  	remove_reference :forwards, :user, index: true, foreign_key: true
  	remove_column :forwards, :date_forwarding, :date
  end
end

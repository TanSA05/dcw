class RemoveUserFromComplaint < ActiveRecord::Migration
  def change
    remove_reference :complaints, :user, index: true, foreign_key: true
  end
end

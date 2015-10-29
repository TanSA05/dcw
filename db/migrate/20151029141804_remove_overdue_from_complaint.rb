class RemoveOverdueFromComplaint < ActiveRecord::Migration
  def change
  	remove_column :complaints, :overdue, :boolean
  end
end

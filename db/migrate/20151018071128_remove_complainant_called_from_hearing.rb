class RemoveComplainantCalledFromHearing < ActiveRecord::Migration
  def change
    remove_column :hearings, :complainant_called, :text
  end
end

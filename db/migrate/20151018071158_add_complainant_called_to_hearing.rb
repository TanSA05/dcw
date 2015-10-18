class AddComplainantCalledToHearing < ActiveRecord::Migration
  def change
    add_column :hearings, :complainant_called, :boolean
  end
end

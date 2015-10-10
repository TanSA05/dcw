class RenameComplaintSummonedToComplainantCalledInHearing < ActiveRecord::Migration
  def change
    remove_column :hearings, :complainant_summoned, :string
    add_column :hearings, :complainant_called, :string
  end
end

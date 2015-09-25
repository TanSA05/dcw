class AddDateToHearing < ActiveRecord::Migration
  def change
    add_column :hearings, :date, :date
  end
end

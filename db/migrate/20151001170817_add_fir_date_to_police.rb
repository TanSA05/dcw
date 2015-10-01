class AddFirDateToPolice < ActiveRecord::Migration
  def change
    add_column :police, :fir_date, :date
  end
end

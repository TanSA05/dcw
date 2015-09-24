class AddCategoryToComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :category, :string
  end
end

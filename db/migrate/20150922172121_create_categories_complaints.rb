class CreateCategoriesComplaints < ActiveRecord::Migration
  def change
    create_table :categories_complaints do |t|
      t.references :category, index: true, foreign_key: true
      t.references :complaint, index: true, foreign_key: true
    end
  end
end

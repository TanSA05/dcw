class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :complainant
      t.string :respondent
      t.string :contact_number
      t.string :address
      t.string :area
      t.string :complaint_number
      t.date :target_date
      t.text :brief
      t.string :nature
      t.references :user, index: true, foreign_key: true
      t.string :file
      t.date :registration_date
      t.string :status
      t.text :prayers
      t.boolean :overdue

      t.timestamps null: false
    end
  end
end

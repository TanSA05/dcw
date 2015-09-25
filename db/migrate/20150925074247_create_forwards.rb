class CreateForwards < ActiveRecord::Migration
  def change
    create_table :forwards do |t|
      t.references :complaint, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :reply_attachment
      t.text :interim_remarks
      t.text :final_remarks
      t.text :feedback_agency
      t.text :feedback_dcw
      t.text :call_center_feedback
      t.date :date_forwarding

      t.timestamps null: false
    end
  end
end

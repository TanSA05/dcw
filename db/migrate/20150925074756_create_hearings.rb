class CreateHearings < ActiveRecord::Migration
  def change
    create_table :hearings do |t|
      t.references :complaint, index: true, foreign_key: true
      t.boolean :complainant_summoned
      t.boolean :respondent_summoned
      t.boolean :complainant_present
      t.boolean :respondent_present
      t.string :other_summoned
      t.boolean :other_present
      t.text :remarks

      t.timestamps null: false
    end
  end
end

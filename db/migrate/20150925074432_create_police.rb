class CreatePolice < ActiveRecord::Migration
  def change
    create_table :police do |t|
      t.references :complaint, index: true, foreign_key: true
      t.text :status_report
      t.string :file
      t.date :date_asking_sr
      t.date :date_target_sr
      t.date :date_sr_filled
      t.text :summons
      t.boolean :fir_status
      t.string :fir_number
      t.string :investigation_process

      t.timestamps null: false
    end
  end
end

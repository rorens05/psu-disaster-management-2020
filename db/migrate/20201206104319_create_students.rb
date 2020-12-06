class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :password_digest
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :gender
      t.date :date_of_birth
      t.string :contact_number
      t.string :address

      t.timestamps
    end
  end
end

class CreateReadAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :read_announcements do |t|
      t.references :announcement, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end

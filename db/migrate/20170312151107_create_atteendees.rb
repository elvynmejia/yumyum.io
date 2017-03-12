class CreateAtteendees < ActiveRecord::Migration
  def change
    create_table :atteendees do |t|
      t.references :user, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

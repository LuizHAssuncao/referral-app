class CreateReferrals < ActiveRecord::Migration[5.2]
  def change
    create_table :referrals do |t|
      t.string :name
      t.string :email
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end

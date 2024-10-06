class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :mobile

      t.timestamps
    end
  end
end

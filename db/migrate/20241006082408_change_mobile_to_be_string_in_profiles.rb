class ChangeMobileToBeStringInProfiles < ActiveRecord::Migration[7.2]
  def change
    change_column :profiles, :mobile, :string
  end
end

class AddNameToGyms < ActiveRecord::Migration[6.0]
  def change
    add_column :gyms, :name, :string
  end
end

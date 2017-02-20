class AddEnToFood < ActiveRecord::Migration[5.0]
  def change
    add_column :foods, :name_en, :string
    add_column :foods, :info_en, :string
  end
end

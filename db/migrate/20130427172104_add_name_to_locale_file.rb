class AddNameToLocaleFile < ActiveRecord::Migration
  def change
    add_column :locale_files, :name, :string, :null=>false
  end
end

class AddFileTypeToLocaleFile < ActiveRecord::Migration
  def change
    add_column :locale_files, :file_type, :integer, :null=>false, :default=>0
  end
end

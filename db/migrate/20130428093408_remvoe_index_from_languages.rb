class RemvoeIndexFromLanguages < ActiveRecord::Migration
  def up
    remove_index :languages, :name
  end

  def down
    add_index :languages, :name, :unique => true
  end
end

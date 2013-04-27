class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
     t.string :name, :limit=>10
    end
    add_index :languages, :name, :unique => true
  end
end

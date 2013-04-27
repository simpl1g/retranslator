class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :name
      t.string :ancestry
      t.references :locale_file

      t.timestamps
    end
    add_index :phrases, :locale_file_id
    add_index :phrases, :ancestry
  end
end

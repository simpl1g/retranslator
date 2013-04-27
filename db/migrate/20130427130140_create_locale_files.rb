class CreateLocaleFiles < ActiveRecord::Migration
  def change
    create_table :locale_files do |t|
      t.string :file
      t.integer :project_id

      t.timestamps
    end

    add_index :locale_files, :project_id
  end
end

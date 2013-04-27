class CreateProjectLanguages < ActiveRecord::Migration
  def change
    create_table :project_languages do |t|
      t.references :project
      t.references :language

      t.timestamps
    end
    add_index :project_languages, :project_id
    add_index :project_languages, :language_id
  end
end

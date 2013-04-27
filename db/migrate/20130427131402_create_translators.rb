class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.references :user
      t.text :description
      t.timestamps
    end
    add_index :translators, :user_id, :unique => true

    create_table :translators_languages do |t|
      t.references :translator_id
      t.references :language_id
      t.integer :level, :limit => 1
      t.text :description
    end
  end
end

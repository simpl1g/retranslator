class CreatePhraseTranslations < ActiveRecord::Migration
  def change
    create_table :phrase_translations do |t|
      t.references :phrase
      t.integer :language_id
      t.references :user
      t.integer :version_number
      t.string :text

      t.timestamps
    end
    add_index :phrase_translations, :phrase_id
    add_index :phrase_translations, :user_id
    add_index :phrase_translations, :language_id
  end
end

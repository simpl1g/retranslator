class CreateTranslationHistories < ActiveRecord::Migration
  def change
    create_table :translation_histories do |t|
      t.references :phrase_translation
      t.references :user
      t.integer :version_number
      t.string :text

      t.timestamps
    end
    add_index :translation_histories, :phrase_translation_id
    add_index :translation_histories, :user_id
  end
end

class RenameColumnsTranslatorsLanguage < ActiveRecord::Migration
  def up
    rename_column :translators_languages, :translator_id_id, :translator_id
    rename_column :translators_languages, :language_id_id, :language_id
  end

  def down
    rename_column :translators_languages, :translator_id, :translator_id_id
    rename_column :translators_languages, :language_id, :language_id_id
  end
end

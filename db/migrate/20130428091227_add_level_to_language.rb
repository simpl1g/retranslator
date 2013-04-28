class AddLevelToLanguage < ActiveRecord::Migration
  def change
    add_column :languages, :level, :integer, :default => 1
    remove_column :translators_languages, :level
  end
end

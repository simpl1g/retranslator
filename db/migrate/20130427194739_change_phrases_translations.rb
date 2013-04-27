class ChangePhrasesTranslations < ActiveRecord::Migration
  def up

    change_table :phrase_translations do |t|
      t.change :version_number, :integer, :default=>0, :null=>false
      t.rename :text, :value
    end

    change_table :translation_histories do |t|
      t.change :version_number, :integer, :default=>0, :null=>false
      t.rename :text, :value
    end

  end

  def down
    change_table :phrase_translations do |t|
      t.change :version_number, :integer
      t.rename :value, :text
    end

    change_table :translation_histories do |t|
      t.change :version_number, :integer
      t.rename :value, :text
    end

  end
end

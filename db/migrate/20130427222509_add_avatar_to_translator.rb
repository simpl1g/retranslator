class AddAvatarToTranslator < ActiveRecord::Migration
  def change
    change_table :translators do |t|
      t.has_attached_file :avatar
      t.string :name
    end
  end
end

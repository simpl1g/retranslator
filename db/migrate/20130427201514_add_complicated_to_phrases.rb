class AddComplicatedToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :complicated, :boolean, :default => false, :null => false
  end
end

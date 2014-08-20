class RenameTableCommets < ActiveRecord::Migration
  def change
  	rename_table :commets, :comments
  end
end

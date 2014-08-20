class ChangeCommentercomment < ActiveRecord::Migration
  def up
  	change_column :comments, :commenter, :integer
  end
end

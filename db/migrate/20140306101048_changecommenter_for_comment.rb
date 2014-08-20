class ChangecommenterForComment < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.rename :commenter, :user_id
    end
  end
end

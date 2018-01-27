class RemoveVotedStaffFromVote < ActiveRecord::Migration[5.1]
  def change
    remove_column :votes, :voted_staff, :string
  end
end

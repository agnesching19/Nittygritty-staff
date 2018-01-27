class AddVotedStaffIdToVote < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :voted_staff_id, :bigint
  end
end

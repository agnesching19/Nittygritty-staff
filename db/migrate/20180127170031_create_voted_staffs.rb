class CreateVotedStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :voted_staffs do |t|
      t.string :name

      t.timestamps
    end
  end
end

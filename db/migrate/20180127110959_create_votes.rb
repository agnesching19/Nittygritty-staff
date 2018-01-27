class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :staff, foreign_key: true
      t.string :voted_staff

      t.timestamps
    end
  end
end

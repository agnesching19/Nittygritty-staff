class RemoveAdminFromStaff < ActiveRecord::Migration[5.1]
  def change
    remove_column :staffs, :admin, :string
  end
end

class AddAdminToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :admin, :boolean, default: false
  end
end

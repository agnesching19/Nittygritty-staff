class PagesController < ApplicationController
  def home
    @staff = Staff.new
  end

  def admin
    @voted_staff = VotedStaff.new
    @voted_staffs = VotedStaff.all
  end

  def stop_vote
    Vote.new ? false : true
    redirect_to admin_path
  end

  def destroy
    @votes = Vote.all
    @votes.each(&:destroy)
    redirect_to admin_path
  end
end

class VotesController < ApplicationController
  before_action :set_vote, only: [:show]
  before_action :set_staff, only: [:new, :create, :show]

  def index
    @votes = Vote.all
    @voted_staff = VotedStaff.find_by_id(params[:voted_staff_id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.staff = @staff
    if @vote.save!
      redirect_to votes_path, notice: 'You just voted successully!'
    else
      render :new
    end
  end

  def show
    @vote.staff = @staff
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_staff
    @staff = Staff.find_by_id(params[:staff_id])
  end

  def vote_params
    params.require(:vote).permit(:staff_id, :voted_staff_id)
  end
end

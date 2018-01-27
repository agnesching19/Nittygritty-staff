class VotesController < ApplicationController
  before_action :set_votes, only: [:show]
  before_action :set_staff, only: [:index, :new, :create, :show]

  def index
    @votes = Vote.all
    @votes.staff = @staff
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.staff = @staff
    if @vote.save
      redirect_to root_path, notice: 'You just voted!'
    else
      render :new
    end
  end

  def new
    @vote = Vote.new
  end

  def edit
  end

  def show
    @vote.staff = @staff
  end

  def update
    if @vote.update(vote_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @vote.staff = @staff
    @vote.destroy
    redirect_to root_path
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_staff
    @staff = Staff.find_by_id(params[:staff_id])
  end

  def vote_params
    params.require(:vote).permit(:voted_staff, :staff_id)
  end
end

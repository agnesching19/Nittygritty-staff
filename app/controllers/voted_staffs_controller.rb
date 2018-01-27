class VotedStaffsController < ApplicationController
  before_action :set_voted_staff, only: [:show, :edit, :update, :destroy]

  def index
    @voted_staffs = VotedStaff.all
  end

  def create
    @voted_staff = VotedStaff.new(voted_staff_params)
    if @voted_staff.save
      redirect_to voted_staffs_path
    else
      render 'pages/home'
    end
  end

  def new
    @voted_staff = VotedStaff.new
  end

  def edit
  end

  def show
  end

  def update
    if @voted_staff.update(voted_staff_params)
      redirect_to voted_staffs_path
    else
      render :edit
    end
  end

  def destroy
    @voted_staff.destroy
    redirect_to voted_staffs_path
  end

  private

  def set_staff
    @voted_staff = VotedStaff.find(params[:id])
  end

  def voted_staff_params
    params.require(:voted_staff).permit(:name)
  end
end

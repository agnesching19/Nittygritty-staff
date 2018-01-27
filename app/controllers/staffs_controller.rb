class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def create
    @staff = Staff.new(staff_params)
    @votes = Vote.all
    if @staff.save
      redirect_to staff_path(@staff)
    else
      render :new
    end
  end

  def new
    @Staff = Staff.new
  end

  def edit
  end

  def show
    @staff = Staff.find(params[:id])
  end

  def update
    if @staff.update(staff_params)
      redirect_to staff_path(@staff)
    else
      render :edit
    end
  end

  def destroy
    @staff.destroy
    redirect_to staffs_path
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:name, :email, :admin)
  end
end

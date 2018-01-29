class PagesController < ApplicationController
  def home
    @staff = Staff.new
  end

  def admin
  end
end

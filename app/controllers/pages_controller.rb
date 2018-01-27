class PagesController < ApplicationController
  def home
    @staff = Staff.new
  end
end

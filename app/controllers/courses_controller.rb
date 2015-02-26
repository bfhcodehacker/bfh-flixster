class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.where(:id => params[:id]).first
  end

end

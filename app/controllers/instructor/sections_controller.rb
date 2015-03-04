class Instructor::SectionsController < ApplicationController
  def new
    @course = Course.where(:id => params[:course_id]).first
    @section = Section.new
  end

  def create
    @course = Course.where(:id => params[:course_id]).first
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end

end

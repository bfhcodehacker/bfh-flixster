class LessonsController < ApplicationController
  def show
    if current_lesson.blank?
      render :text => "Not Found", :status => :not_found
    end
  end

  private
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.where(:id => params[:id]).first
  end

end

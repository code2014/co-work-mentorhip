class CoursetimesController < ApplicationController
  before_filter :authorize_loggedin, :except => ["show"]
  before_filter :load_course

  def create
    @coursetime = @course.coursetimes.new(params[:coursetime])

    respond_to do |format|
      if @coursetime.save
        format.html { redirect_to @course, notice: 'Course Time was successfully created.' }
        format.json { render json: @coursetime, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @coursetime.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @coursetime = @course.coursetime.find(params[:id])
    @course = @coursetime.course
    
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @coursetime, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coursetime.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coursetime = @course.coursetimes.find(params[:id])
    @coursetime.destroy

    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end

  private

  def load_course
    @course = Course.find(params[:course_id])
  end
end

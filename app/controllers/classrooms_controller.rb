class ClassroomsController < ApplicationController

  before_action :find_classroom, only: [:show,:edit,:update,:destroy]
  def index

  end

  def new
    @classroom = current_user.classrooms.build
  end

  def show

  end
  def create

    @classroom = current_user.classrooms.build(classroom_params)

    if @classroom.save

      redirect_to "/teachers/#{current_user.username}", notice: "Succesully created new classroom"
  else
    render 'new'
    end
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to @classroom, notice: "Pin was succesfully updated"
    else
    render 'edit'
  end
  end

  def all
    @classroom = Classroom.all

  end

  def destroy
    @classroom.destroy
    redirect_to root_path
  end



  private

  def classroom_params
    params.require(:classroom).permit(:fullname, :image,  :grade, :description, :subject)
  end

  def find_classroom
    @classroom = Classroom.find(params[:id])
  end


end

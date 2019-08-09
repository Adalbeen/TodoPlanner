class EditController < ApplicationController

  def index
    @todo = Todo.new(todo_params)
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private

  def todo_params
    params[:DateOfCreation] = Time.now
    params[:owner] = current_user.email
    params[:check] = false
    params[:text] = params[:todo]['text'] if params[:todo]
    params.permit(:text, :check, :DateOfCreation, :owner, :todo)
  end


end

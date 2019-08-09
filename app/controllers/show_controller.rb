class ShowController < ApplicationController


  def index
    @current_user = current_user
    @todos = []
    @todos = Todo.where("owner = '#{current_user.email}'") if current_user

  end

  def update
    @todo.update(params.require(:post).permit(:text))
  end

end

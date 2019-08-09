class TodosController < ApplicationController
  def index
    todos = Todo.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'Loaded Users', data:todos},status: :ok
  end

  def show
    todo = Todo.find(params[:id])
    render json: {status: 'SUCCESS', message:'Todos loaded', data:todo},status: :ok
  end

  def create
    todo = Todo.new(todo_params)
    todo['check'] = false
    todo['DateOfCreation'] = Time.now
    todo['owner'] = current_user.email
    if todo.save
      redirect_to action: "index", controller: 'show'
    else
      render json: {status: 'ERROR', message:'Todo not saved', data:todo.errors},status: :unprocessable_entity
    end
  end

  def destroy
    todo = Todo.find(params[:id])

    if todo.destroy
      redirect_to action: "index", controller: 'show'
    else
      render json: {status: 'ERROR', message:'Todo cannot be deleted', data:todo.errors},status: :unprocessable_entity
    end

  end

  def update
    todo = Todo.find(params[:id])
    if todo.update_attributes(todo_params)
      redirect_to action: "index", controller: 'show'
    else
      render json: {status: 'ERROR', message:'Todo cannot be edited', data:todo.errors},status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params[:text] = params[:todo]['text'] if params[:todo]
    params.permit(:text, :check)
  end

end

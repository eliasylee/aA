class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all

    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors
    end
  end

  def update
    @todo = Todo.find_by_id(params[:id])
    @todo.update(todo_params)

    render json: @todo
  end

  def destroy
    @todo = Todo.find_by_id(params[:id])
    @todo.destroy

    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

end

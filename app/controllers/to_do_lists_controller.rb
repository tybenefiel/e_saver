class ToDoListsController < ApplicationController

  def index
    @to_do_lists = ToDoList.all
  end

  def show
    @to_do_list = ToDoList.find_by(id: params[:id])
  end

  def new
  end

  def create
    @to_do_list = ToDoList.new
    @to_do_list.user_id = params[:user_id]

    if @to_do_list.save
      redirect_to to_do_lists_url, notice: "To do list created successfully."
    else
      render 'new'
    end
  end

  def edit
    @to_do_list = ToDoList.find_by(id: params[:id])
  end

  def update
    @to_do_list = ToDoList.find_by(id: params[:id])
    @to_do_list.user_id = params[:user_id]

    if @to_do_list.save
      redirect_to to_do_lists_url, notice: "To do list updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @to_do_list = ToDoList.find_by(id: params[:id])
    @to_do_list.destroy

    redirect_to to_do_lists_url, notice: "To do list deleted."
  end
end

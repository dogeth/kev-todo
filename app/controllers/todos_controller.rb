class TodosController < ApplicationController
  include ApplicationHelper 
  
  before_filter :find_item, :only => [:destroy, :done, :undo]

  
  def index
    @todos = Todo.all(:order => "created_at desc")
  end
  
  def create
    @todo = Todo.create(params[:todo])
    @todo.user = current_user || 'unknown'
    save_item 'todo added'
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    if @todo.delete
      flash[:notice] = "Todo deleted"
      redirect_to root_path
    else
      flash.now[:error] = "Oops!"
      @todos = Todo.all(:order => "created_at desc")
      render :action => 'index'
    end    
  end
  
  def done
    @todo.complete = true
    save_item 'todo done!'
  end  
  
  def undo
    @todo.complete = false
    save_item 'todo undone!'
  end  

private

  def find_item
    @todo = Todo.find(params[:id])
  end
  
  def save_item message
    if @todo.save!
      flash[:notice] = message
    else
      flash.now[:error] = "Oops!"
    end    
    redirect_to root_path
  end
  
end

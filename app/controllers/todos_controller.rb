class TodosController < ApplicationController
  include ApplicationHelper 
  
  before_filter :find_item, :only => [:update, :show, :destroy, :done, :undo]

  
  def index
    if params[:tags]
      @tag = Tag.find_by_name(params[:tags])
      @todos = @tag.todos
    else
      @todos = Todo.all(:order => "created_at desc")
    end
    
  end
  
  def show
  end
  
  def create
    @todo = Todo.create(params[:todo])
    @todo.user = current_user || 'unknown'
    save_item 'todo added'
    redirect_to root_path
  end
  
  def update
    if @todo.update_attributes(params[:todo])
      flash[:notice] = "Yippie, tag added"
    else
      flash.now[:error] = "Oops!"
    end    
    redirect_to(@todo)
  end
  
  def destroy
    if @todo.delete
      flash[:notice] = "Todo deleted"
    else
      flash[:error] = "Oops!"
    end    
    redirect_to root_path
  end
  
  def done
    @todo.complete = true
    save_item 'todo done!'
    redirect_to root_path
  end  
  
  def undo
    @todo.complete = false
    save_item 'todo undone!'
    redirect_to root_path
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
  end
  
end

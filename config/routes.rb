ActionController::Routing::Routes.draw do |map|
  map.resources :todos, :member => {:done => :put, :undo => :put}

  map.root :controller => 'todos'
end

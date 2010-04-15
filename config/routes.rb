ActionController::Routing::Routes.draw do |map|
  map.resources :todos, :member => {:done => :put, :undo => :put}
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
  map.root :controller => 'todos'
end

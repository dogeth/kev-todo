class Tag < ActiveRecord::Base
  has_many :todo_tags
  has_many :todos, :through => :todo_tags
end

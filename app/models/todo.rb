class Todo < ActiveRecord::Base
  validates_presence_of :title
  has_many :todo_tags
  has_many :tags, :through => :todo_tags
  
  attr_accessor :new_tag
  
  after_save :add_tag
  
  protected
  
  def add_tag
    self.tags << Tag.find_or_create_by_name(@new_tag) unless @new_tag.blank?
  end
  
end

class Category < ActiveRecord::Base
  attr_accessible :title, :parent_id, :description, :position, :haschild

  has_many :childs, :class_name => "Category", :foreign_key=>"parent_id", :dependent=> :destroy
  belongs_to :parent, :class_name=>"Category"
  before_save :has_parent

  def has_parent
    self.haschild = true
  	self.parent_id ||= 0
  end


end

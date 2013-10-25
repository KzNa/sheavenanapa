class Category < ActiveRecord::Base
  attr_accessible :title, :parent_id, :description, :position, :haschild

  has_many :childs, :class_name => "Category", :foreign_key=>"parent_id", :dependent=> :destroy
  belongs_to :parent, :class_name=>"Category"
  has_many :images, :as=>:imageble

  before_save :has_parent

  def has_parent
    
  	self.parent_id ||= 0
  end
 
  def thumb
    thumb = "/system/images/no-image-thumb.png"
    if self.images.length>0
      thumb = self.images[0].thumb
    end
    thumb
  end
  
  def medium
    medium = "/system/images/no-image-midium.png"
    if self.images.length>0
      medium = self.images[0].medium
    end
    medium
  end
 
  def main_image_id
    id=0
    if self.images.length>0
      id = self.images[0].id
    end
    id
  end

end

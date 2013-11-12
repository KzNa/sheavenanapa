class Image < ActiveRecord::Base
  attr_accessible :image, :title, :imageble_id
  belongs_to :imageble, :polymorphic => true
  has_attached_file :image, :styles => {:small=>"30x30>", :medium => "300x300>", :thumb=> "130x130>"}, :default_url => "/images/:style/missing.png"
  
  def thumb
    self.image.url(:thumb)
  end
 
  def original
    self.image.url(:original)
  end

  def medium
    self.image.url(:medium)
  end
  
  def small
    self.image.url(:small)
  end

end	
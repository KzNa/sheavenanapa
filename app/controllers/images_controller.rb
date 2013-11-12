class ImagesController < ApplicationController
  def index
    @images = Image.where("imageble_id = ?", params[:category_id])
   
    data = @images.to_json(:only=>[:id,:image_file_name,:image_file_size,:title,:imageble_id,:imageble_type],:methods=>[:thumb, :original])
      respond_to do |format|
        format.html
        format.json {render json: data}
      end
  end

  def all_images
  image = Image.where("id <> ?", 0)
  data = image.to_json(:only=>[:id,:image_file_name,:image_file_size,:title,:imageble_id,:imageble_type],:methods=>[:thumb, :original])
  respond_to do |format|
    format.json{render :json => data}
  end
end
  
  def create
    @image = Image.new(:image=>params[:files], title: params[:title])
    @image.imageble_type = "Category"
    @image.imageble_id = params[:category_id]
    @image.save
  end
  
  def show
  image = Image.find(params[:id])
    respond_to do |format|
      format.json {render :json=>image}
    end
end
  

  def update

    image = Image.find(params[:id])
    image.update_attributes(title: params[:title])
    respond_to do |format|
      format.json {render :json=>[]}
  end 
    
  end
  
  def destroy
    Image.find(params[:id]).destroy
    respond_to do |format|
      format.html
      format.json { render :json=>[]}
    end
  end
end

class ImageController < ApplicationController
  def index
    @images = Image.where("id <> ?", 0)
    filter = params[:filter]
    if params.has_key? "filter"
      for filt in filter[:filters]
      #  data = filt[1][:operator].to_json
        op = filt[1][:operator]
        field = filt[1][:field]
        val = filt[1][:value]
        case op
          when "eq" then
            @images = @images.where("#{field} = ?", val)
          when "neq" then
            @images = @images.where("#{field} <> ?", val)
          when "contains" then
            @images = @images.where("#{field} like ?", val)
        end
      end
    end
    data = @images.to_json(:only=>[:id,:image_file_name,:image_file_size,:title,:imageble_id,:imageble_type],:methods=>[:thumb, :medium])
    respond_to do |format|
      format.html
      format.json {render json: data}
    end
  end
  def create
    #files = params[:files]
    #titles = params[:titles].split(",").map {|item| item.strip}
    #i=0
    #images = []
    #files.each do |file|
    #  image = Image.new
    #  image.image = file
    #  image.title = titles[i]
    #  image.save
    #  images[i]=image.id
    #  i++
    #end
    @image = Image.new(:image=>params[:files], :title=>params[:title])
    @image.save
    for par in params
      if par[0] =~ /^(\w+)_id$/
        obj = $1.classify.constantize
        o = obj.find(par[1])
        if ['product'].include? $1
          o.images.push(@image)
        else
          if not o.image.nil?
            o.image.destroy
          end
          o.image = @image
        end
      end
    end
    render :json=>{}
  end
  def show
    
  end
  def update
    
  end
  def del
    file_name = params[:fileNames]
    @image=Image.where(:image_file_name=>file_name)
    @image.each do |img|
      img.destroy
    end
    respond_to do |format|
      format.html
      format.json { render :json=>{}}
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

 class CategoriesController < ApplicationController
def index
	id = params[:id]
	@category = Category.where(:parent_id => id)
	
	if id 
		return respond_to do |format|	
			format.json {render :json => @category}
		end 
	end
	
	
	@categories = Category.where(:parent_id=>0)	
	 respond_to do |format|
		 format.json  { render :json => @categories }
	 end
end

def show
	category = Category.find(params[:id])
	respond_to do |format|
		format.json {render :json=>category}
	end
end

def all
	categories = Category.where("id <> ?", 0);
	respond_to do |format|
		format.json{render :json => categories}
	end
end
	   
  def create
  	@category = Category.create(title: params[:title], name: params[:name], description: params[:description], parent_id: params[:parent_id], haschild: params[:haschild]) 
  end

  def new
  	
  end

  def update
  	category = Category.find(params[:id])
  	category.update_attributes(title: params[:title], name: params[:name], description: params[:description], parent_id: params[:parent_id], haschild: params[:haschild] )
  	respond_to do |format|
  		format.json {render :json=>[]}
  end 
  end

  def destroy
  	category = Category.find(params[:id])
  	category.destroy
  end

end

	

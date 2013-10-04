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
	   
    
end

	

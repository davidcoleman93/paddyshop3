class ProductsController < ApplicationController
  def index
	@products = Product.all
  end

  def new
  
  end
  
  def create
	@product = Product.new(product_params)
	
	if @product.save
		flash[:notice] = "Product created successfully"
		redirect_to(:action => "index")
	else
		render("new")
	end
  end

  def edit
	@product = Product.find(params[:id])
  end
  
  def update
	@product = Product.find(params[:id])
	if @product.update_attributes(product_params)
		flash[:notice] = "Product updated successfully"
		redirect_to(:action => "show", :id => @product.id)
	else
		render("edit")
	end
  end

  def delete
	@product = Product.find(params[:id])
  end

  def destroy
	@product = Product.find(params[:id])
	@product.destroy
	flash[:notice] = "Product destroyed successfully"
	redirect_to(:action => "index")
  end
  
  def show
	@product = Product.find(params[:id])
	
	@posts = Post.where(product_id: @product.id)
  end
  
  private
	def product_params
	#same as using “params[:user]”, except that it:
	# - raises an error if :user is not present
	# - allows listed attributes to be mass-assigned
		params.require(:product).permit(:title, :manufacturer, :category, :image, :stock_level, :price)
	end
end

class PostsController < ApplicationController
  load_and_authorize_resource :product
  load_and_authorize_resource :through => :product

  skip_authorize_resource :only => :show  
  skip_authorize_resource :product, :only => :show
  
  def create
	@product = Product.find params[:product_id]
	
	@post = @product.posts.new(post_params)
	
	@post.user_id = current_user.id
	#@post.user_id = session[:user_id]
	@post.save
	
	respond_to do |format|
		format.html { redirect_to @product }
    end
  end
  
  def edit
	@product = Product.find(params[:product_id])
    @post = @product.posts.find(params[:id])
  end
  
  def update
	@product = Product.find(params[:product_id])
    @post = @product.posts.find(params[:id])

    if @post.update(post_params)
	  flash[:notice] = "Post updated successfully"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end
  
  def delete
	@product = Product.find(params[:product_id])
    @post = @product.posts.find(params[:id])
  end
  
  def destroy
	@product = Product.find(params[:product_id])
    @post = @product.posts.find(params[:id])
	@post.destroy
	flash[:notice] = "Post destroyed successfully"
	redirect_to product_path(@product)
  end
  
  private
	def post_params
	#same as using “params[:post]”, except that it:
	# - raises an error if :post is not present
	# - allows listed attributes to be mass-assigned
		params.require(:post).permit(:id, :content, :user_id, :product_id)
	end
end

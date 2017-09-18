class SampleController < ApplicationController
  def index
    @products = Product.order(:name)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to edit_product_path(@product), notice: 'Product created'
    else
      render :new
    end
  end

  def show
    redirect_to edit_product_path(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: 'Product updated'
    else
      render :edit
    end
  end

  def toggle
    @product = Product.find(params[:id])
    @product.toggle!(:enabled)
    redirect_to products_path, notice: 'Product updated'
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: 'Product deleted'
  end

  private

  def product_params
    params.require(:product).permit(:name, :video, :title, :subtitle)
  end
end

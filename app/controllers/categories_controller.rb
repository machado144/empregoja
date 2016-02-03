class CategoriesController < ApplicationController
    before_action :authenticate_user!

  def show
    @category = Category.find(params[:id])
  end

  def new
    if user_signed_in?
      @category = Category.new
    else
      redirect_to new_user_session_path      
    end
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      redirect_to @category
    else
      flash[:warning] = 'Warning! All fields are mandatory.'
      render :new
    end
  end
end

class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :redirect_if_not_admin
  
  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    @category = current_resource
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category = current_resource
  end

  # POST /categories
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: t("flash.notice.successfully_created", class: t("categories.categorie")) }
        format.js   {}
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  def update
    @category = current_resource
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: t("flash.notice.successfully_updated", class: t("categories.categorie") )
    else
      render action: "edit"
    end
  end

  # DELETE /categories/1
  def destroy
    @category = current_resource
    @category.destroy
    redirect_to categories_path
  end

  def current_resource
    @current_resource ||= Category.where(id: params[:id]).first
  end
end

class ResourcesController < ApplicationController
  before_action :set_resource

  def index
    @resources = Resource.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
  end

  def create
    @resource = Resource.new resource_params
    @resource.user = current_user
    respond_to do |format|
      if @resource.save
        ActionCable.server.broadcast 'resources', resource: { title: @resource.title, url: resource_path(@resource), image: @resource.image, author: @resource.user.email }
        format.html { redirect_to edit_resource_path(@resource), notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def categorize
    @category = Category.find params[:category_id]
    @resource.categories << @category unless @category.nil? or @category.in? @resource.categories
    redirect_to :back
  end

  def uncategorize
    @category = Category.find params[:category_id]
    @resource.categories.delete @category unless @category.nil?
    redirect_to :back
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_resource
      @resource = Resource.find params[:id] if params.include? :id
      @resource = Resource.find params[:resource_id] if params.include? :resource_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :abstract, :url, :image, :category_ids, category_ids: [])
    end
end

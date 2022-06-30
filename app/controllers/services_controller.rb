class ServicesController < ApplicationController
  before_action :search_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    #@articles = Article.paginate(page: params[:page], per_page: 5)
    @service = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params)
    @service.user = current_user
    if @service.save
      flash[:notice] = "Serviço criado com sucesso!"
      redirect_to service_path(@service)
    else
      render "new"
    end
  end


  def edit
  end

  def update
    if @service.update(service_params)
      flash[:notice] = "Serviço editado com sucesso!"
      redirect_to service_path(@service)
    else
      render 'edit'
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private 

  def service_params
    return params.require(:service).permit(:title, :description, :limit_date, :value)
  end

  def search_article
    return @service = Service.find(params[:id])
  end
end
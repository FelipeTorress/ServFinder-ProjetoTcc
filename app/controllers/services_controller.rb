class ServicesController < ApplicationController
  before_action :search_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @user_service = UserService.new
    @user_service.service = Service.find(params[:id])
  end

  def index
    #mudar para 19
    @service = Service.paginate(page: params[:page], per_page: 4)
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

  def edit; end

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
    params.require(:service).permit(:title, :description, :limit_date, :value)
  end

  def search_article
    @service = Service.find(params[:id])
  end
end

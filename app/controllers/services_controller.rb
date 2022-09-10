class ServicesController < ApplicationController
  before_action :search_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @user_service = UserService.new
    @user_service.service = Service.find(params[:id])


    @prestadores = UserService.where(service: params[:id])
    @prestador_escolhido = User.find(@user_service.service.user_selected_id) if @user_service.service.user_selected_id

    @user_location = UserPlace.find_by(user: @service.user)
    return unless @user_location

    @place = Place.find(@user_location.place.id)
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     (:service).permit(:title, :description, :limit_date, :value)
  end

  def search_service
    @service = Service.find(params[:id])
  end
end

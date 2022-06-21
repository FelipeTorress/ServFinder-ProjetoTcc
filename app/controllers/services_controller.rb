class ServicesController < ApplicationController

  def show
  end

  def index
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params)
    #@article.user = current_user
    if @service.save
      flash[:notice] = "Serviço criado com sucesso!"
      redirect_to service_path(@service)
    else
      render "new"
    end
  end

  private 

  def service_params
    return params.require(:service).permit(:title, :description, :encerramento_anuncio, :preco)
  end
end
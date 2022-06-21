class ServicesController < ApplicationController

  def show
    #remover dps
    @service = Service.find(params[:id])
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
    #@article.user = current_user
    if @service.save
      flash[:notice] = "Serviço criado com sucesso!"
      redirect_to service_path(@service)
    else
      render "new"
    end
  end


  def edit
    @service = Service.find(params[:id])#remover dps
  end

  def update
    @service = Service.find(params[:id]) #remover dps
    if @service.update(service_params)
      flash[:notice] = "Artigo editado com sucesso!"
      redirect_to service_path(@service)
    else
      render 'edit'
    end
  end

  def destroy
    # @service.destroy
    # redirect_to service_path

    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private 

  def service_params
    return params.require(:service).permit(:title, :description, :encerramento_anuncio, :preco)
  end
end
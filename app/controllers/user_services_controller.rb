class UserServicesController < ApplicationController
  before_action :authenticate_user!
  def create
    service = Service.find(user_service_service)
    if UserService.find_by(user: current_user, service: service)
      flash[:alert] = 'Você ja está inscrito neste serviço!'
    else
      user_service = UserService.create(user_service_comment)
      user_service.service = service
      user_service.user = current_user
      if user_service.save
        flash[:notice] = 'Inscrição realizada com sucesso!'
      else
        flash[:alert] = 'Ocorreu um Erro! Tente Novamente'
      end
    end
    redirect_to service_path(service)
  end

  private

  def user_service_comment
    params.require(:user_service).permit(:comment)
  end

  def user_service_service
    params.require(:user_service).permit(:service)[:service]
  end
end

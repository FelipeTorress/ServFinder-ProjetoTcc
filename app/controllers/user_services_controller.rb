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

  def update
    service = Service.find(user_service_service)
    service.user_selected_id = user_service_prestador
    if service.save
      flash[:notice] = 'Prestador Selecionado! Entre em contato ou aguarde.'
    else
      flash[:alert] = 'Ocorreu um erro! Tente novamente mais tarde.'
    end
    redirect_to service_path(service)
  end

  def show
    @services = Service.where(id: params[:id].split('/'))
    @services.each do |service|
      log_exists = UserLog.where(info: "SeenUser: #{service.user_selected_id}")

      next unless log_exists.empty?

      log = UserLog.new
      log.action = 'SeeUser'
      log.date_of_occurrence = DateTime.now
      log.user_of_action = current_user.id
      log.info = "SeenUser: #{service.user_selected_id}"
      log.save
    end
  end

  def destroy
    service_finish = user_service_delete
    service = Service.find(service_finish[:service_id])
    service.finished = true
    service.save

    messages = Message.where(chat_id: service_finish[:chat])
    messages.destroy_all

    user = User.find(service.user_selected_id)
    user.services_realized += 1

    if user.score.nil?
      user.score = service_finish[:comment].to_i
    else
      user.score += service_finish[:comment].to_i
    end
    user.save

    flash[:notice] = 'Serviço Finalizado'
    redirect_to user_path(service.user)
  end

  private

  def user_service_comment
    params.require(:user_service).permit(:comment)
  end

  def user_service_service
    params.require(:user_service).permit(:service)[:service]
  end

  def user_service_prestador
    params.require(:user_service).permit(:prestador)[:prestador]
  end

  def user_service_delete
    params.require(:user_service).permit(:comment, :chat, :service_id)
  end
end

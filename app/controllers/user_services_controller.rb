class UserServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    return unless params[:search]

    service = Service.where('title like ?', "%#{params[:search].strip}%")
    @service = service.paginate(page: params[:page], per_page: 4)
    flash[:notice] = 'Resultados para sua busca'
  end

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
      log = UserLog.new
      log.action = 'ServiceProgress'
      log.date_of_occurrence = DateTime.now
      log.user_of_action = current_user.id
      log.info = "Prestador: #{user_service_prestador}"
      log.save
      flash[:notice] = 'Prestador Selecionado! Entre em contato ou aguarde.'
    else
      flash[:alert] = 'Ocorreu um erro! Tente novamente mais tarde.'
    end
    redirect_to service_path(service)
  end

  def show
    @services = Service.where(id: params[:id].split('/'))

    if current_user.isContratante
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
    else
      @place = {}
      @services.each do |service|
        user_location = UserPlace.find_by(user: service.user)
        @place[service.user.id] = Place.find(user_location.place.id) if user_location
        log_exists = UserLog.where(info: "SeenUser: #{service.user.id}")

        next unless log_exists.empty?

        log = UserLog.new
        log.action = 'SeeUser'
        log.date_of_occurrence = DateTime.now
        log.user_of_action = current_user.id
        log.info = "SeenUser: #{service.user.id}"
        log.save
      end
    end
  end

  def destroy
    service_finish = user_service_delete
    service = Service.find(service_finish[:service_id])
    prestador_confirm = ActiveModel::Type::Boolean.new.cast(service_finish[:prestador_confirm])
    if prestador_confirm
      service.finished_prestador = true
      service.save

      flash[:notice] = 'Serviço Marcado como Realizado!'
      redirect_to user_path(service.user_selected_id)
    elsif !prestador_confirm && service.finished_prestador
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
    else
      flash[:alert] = 'O prestador precisa confirmar a realização do serviço!'
      redirect_to user_service_path
    end
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
    params.require(:user_service).permit(:comment, :chat, :service_id, :prestador_confirm)
  end
end

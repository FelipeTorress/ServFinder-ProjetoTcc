module ApplicationHelper
  def services_on_going(current_user)
    services = if current_user.isContratante
                 Service.where(user_id: current_user.id).reject { |service| service.user_selected_id.nil? }
               else
                 Service.where(user_selected_id: current_user.id)
               end
    services.map(&:id)
  end

  def get_prestadores_on_goin(service)
    User.find(service.user_selected_id)
  end
end

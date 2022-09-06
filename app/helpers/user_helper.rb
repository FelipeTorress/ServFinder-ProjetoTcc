module UserHelper
  def count_realized_services(user)
    services = Service.find_by(user_selected_id: user.id, finished: true)
    services ? services.size : 0
  end
end

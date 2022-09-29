module DeviseBootstrapViewsHelper
  def bootstrap_devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map do |msg|
      if msg.include? 'Password'
        msg.gsub! 'Password', 'Senha'
      elsif msg.include? 'Name'
        msg.gsub! 'Name', 'Nome'
      elsif msg == 'Accepted terms of use não pode ficar em branco'
        msg = 'Você precisa aceitar os Termos de Uso'
      elsif msg == 'Accepted privacy policy não pode ficar em branco'
        msg = 'Você precisa aceitar a Política de Privacidade'
      elsif msg.include? 'Current password'
        msg = 'Para atualizar seus dados digite sua senha no campo indicado!'
      elsif msg.include? 'Address'
        msg.gsub! 'Address', 'Endereço'
      end
      content_tag(:li, msg)
    end.join

    sentence = I18n.t('errors.messages.not_saved',
        count: resource.errors.count, 
        resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger alert-block">
        <h5>#{sentence}</h5>
        <ul class="text-start">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
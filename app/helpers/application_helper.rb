module ApplicationHelper
  def current_trader
    current_user.trader
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def d_contact(model,dt_cla=nil)
    tmp = content_tag(:dt,model.name, class: dt_cla)
    case model.class
    when Contact::Base
      tmp += content_tag(:dd,model.value)
    when Contact::Link
      tmp += content_tag(:dd,link_to(model.value,model.value, target: '_blank'))
    when Contact::Picture
      tmp += content_tag(:dd,image_tag(model.value))
    else
      tmp += content_tag(:dd,model.value)
    end
  end

  def d(model,attr)
    if model.respond_to? attr and !model.send(attr).blank?
      tmp = content_tag(:dt,model.class.human_attribute_name(attr))
      tmp += content_tag(:dd,model.send(attr))
    else
      ''
    end
  end

  def default_meta_tags
    if controller_name == 'home'
      name = "#{t('title')}"
    else
      name = "#{t("controller.#{controller_name}")} | #{t('title')}"
    end
    {
      site: name,
      description: t('desc'),
      keywords: t('keywords'), 
      reverse: true
    }
  end
end

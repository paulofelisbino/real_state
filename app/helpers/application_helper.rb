module ApplicationHelper
  def noty_flash_message
    javascript_tag do
      flash.map do |message_type, message|
        "new Noty({
          theme: 'bootstrap-v4',
          text: '#{message}',
          type: '#{message_type}',
          layout: 'topCenter',
          animation: {
            open: 'animated fadeInDown',
            close: 'animated fadeOutUp'
          },
          timeout: 3000,
          visibilityControl: true
        }).show();"
      end.join("\n").html_safe
    end
  end
end

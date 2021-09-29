module SessionsHelper
  def flash_massages
    if flash[:alert]
      return content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end

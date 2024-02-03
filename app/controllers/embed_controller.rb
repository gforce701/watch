class EmbedController < ApplicationController
  
  def inject
    @iframe_url = iframe_url()
    render 'inject.js'
  end

  def iframe
    @page = Page.where(url: params[:url]).first_or_create do |page|
      page.user = current_user
    end

    response.headers.delete "X-Frame-Options"
    render layout: false
  end

end

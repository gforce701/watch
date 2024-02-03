class EmbedController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:inject]
  b#efore_action :authorize, only: [:iframe]

  def inject
    @iframe_url = iframe_url()
    render 'inject'
  end

  def iframe
    @page = Page.where(url: params[:url]).first_or_create do |page|
      page.user = current_user
    end

    response.headers.delete "X-Frame-Options"
    render layout: false
  end

end

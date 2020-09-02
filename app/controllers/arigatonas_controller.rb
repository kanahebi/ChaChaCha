class ArigatonasController < ApplicationController
  skip_before_action :require_login, only: [:index]

  # GET /arigatonas
  # GET /arigatonas.json
  def index
    authorize Arigatona

    if params[:filter] == 'me'
      current_user.check_arigatonas!
      @arigatonas = current_user.arigatonas
    else
      @arigatonas = Arigatona.where(user: current_user.client.users)
    end
  end
end

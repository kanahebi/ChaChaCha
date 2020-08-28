class ArigatonasController < ApplicationController
  skip_before_action :require_login, only: [:index]

  # GET /arigatonas
  # GET /arigatonas.json
  def index
    authorize Arigatona

    @arigatonas = if params[:filter] == 'me'
      current_user.arigatonas
    else
      Arigatona.all
    end
  end
end

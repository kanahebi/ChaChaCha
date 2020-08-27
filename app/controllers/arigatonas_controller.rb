class ArigatonasController < ApplicationController
  skip_before_action :require_login, only: [:index]

  # GET /arigatonas
  # GET /arigatonas.json
  def index
    authorize Arigatona

    @arigatonas = Arigatona.all
  end
end

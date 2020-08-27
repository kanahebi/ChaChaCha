class ClientAdmin::RootsController < ApplicationController
  def index
    authorize [:client_admin, :root]
  end
end

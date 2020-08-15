class SystemAdmin::RootsController < ApplicationController
  def index
    authorize [:system_admin, :root]
  end
end

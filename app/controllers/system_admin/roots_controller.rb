class SystemAdmin::RootsController < ApplicationController
  def index
    authorize :root
  end
end

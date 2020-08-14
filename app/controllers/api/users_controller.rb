class Api::UsersController < Api::ApplicationController
  # GET /api/users
  # GET /api/users.json
  def index
    authorize [:api, User]

    users = User.where(client_id: current_user.client_id)
    users = users.where(department_id: params[:department_id]) if params[:department_id]

    render json: users.map { |u| u.slice(:id, :name) }
  end
end

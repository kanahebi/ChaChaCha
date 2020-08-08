# frozen_string_literal: true

module LoginHelper
  def login(user)
    post session_url, params: {
      session: {
        unique_name: user.unique_name,
        password: "password",
      },
    }
  end
end

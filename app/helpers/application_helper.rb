module ApplicationHelper
  def root_path_judged_by_role
    return root_url unless current_user

    case current_user.role
    when 'system_admin'
      system_admin_root_url
    when 'client_admin'
      client_admin_root_url
    when 'client_general'
      root_url
    end
  end
end

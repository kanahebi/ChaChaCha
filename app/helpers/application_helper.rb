module ApplicationHelper
  def root_path_judged_by_role
    return root_url unless current_user

    case current_user.role
    when 'system_admin'
      system_admin_root_url
    when 'client_admin'
      # TODO: クライアント管理者用画面作ったらそっちにする
      root_url
    when 'client_general'
      root_url
    end
  end
end

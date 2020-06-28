module UsersHelper
  def actual_user?
    current_user == @user
  end

  def current_user_links(user)
    link_to 'Edit User Account', edit_user_path(user), class: 'btn btn-light' if actual_user?
  end

  def current_user_links2(user)
    link_to 'Delete Account', user_path(user), method: :delete, class: 'btn btn-light ml-2' if actual_user?
  end
end

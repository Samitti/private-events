module ApplicationHelper
  def user_name(*)
    if current_user
      link_to current_user.name, user_path(current_user), class: 'nav-link btn'
    end
  end

  def user_links(*)
    if current_user
      link_to 'Sign Out', session_path, method: :delete, class: 'nav-link'
    else
      link_to 'Sign Up', new_user_path, class: 'nav-link'
    end
  end

  def user_links2(*)
    if !current_user
      link_to 'Sign In', new_session_path, class: 'nav-link'
    end
  end
  
end

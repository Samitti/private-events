module UsersHelper
  def actual_user?
    current_user == @user
  end
end

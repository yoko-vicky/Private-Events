module EventsHelper
  def users_to_invite
    User.where.not(id: current_user.id).map(&:name)
  end
end

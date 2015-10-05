class UserPresenter < BasePresenter

  ROLES = User::ROLES.invert

  # safely return subscribed package name
  #
  # @returns subscribed package name
  def subscription_name
    return 'Not Subscribed'.freeze if object.subscription.nil?

    object.subscription.name
  end

  # safely returns user current role
  #
  # @returns user role name
  def role_name
    return 'Not Assigned' unless object.role.present?
    ROLES[object.role].to_s.humanize
  end
end
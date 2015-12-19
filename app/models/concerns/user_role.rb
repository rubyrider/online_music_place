module UserRole

  extend ActiveSupport::Concern

  ROLES = {
      :user => 0,
      :admin => 1,
      :moderator => 2,
      :reporter => 3,
      :collection_manager => 4
  }

  #
  # self.user? => true
  # self.admin? => true
  # self.moderator? => true
  # self.reporter? => true
  # self.collection_manager? => true
  # @returns true or fales #
  ROLES.each do |role_name, role_value|
    define_method "#{role_name}?" do
      self.role == role_value
    end
  end

  def current_role
    User::ROLES.invert[self.role].to_s.humanize
  end

end

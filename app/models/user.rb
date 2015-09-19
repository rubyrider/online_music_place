class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :subscription

  ROLES = {
      :user => 0,
      :admin => 1,
      :moderator => 2,
      :reporter => 3,
      :collection_manager => 4
  }
end

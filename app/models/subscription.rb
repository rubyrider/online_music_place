# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  details    :text(65535)
#  start_date :date
#  end_date   :date
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ActiveRecord::Base
end

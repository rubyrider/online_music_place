# == Schema Information
#
# Table name: ad_positions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdPosition < ActiveRecord::Base
end

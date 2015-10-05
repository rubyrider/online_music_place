# == Schema Information
#
# Table name: advertisements
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text(65535)
#  from_date      :date
#  end_date       :date
#  featured       :boolean
#  ad_position_id :string(255)
#  height         :float(24)
#  width          :float(24)
#  modal          :boolean
#  custom_css     :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_advertisements_on_ad_position_id  (ad_position_id)
#

class Advertisement < ActiveRecord::Base
end

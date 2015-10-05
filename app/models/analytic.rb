# == Schema Information
#
# Table name: analytics
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  content_type :string(255)
#  metric_name  :string(255)
#  count        :string(255)
#  content_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_analytics_on_content_id  (content_id)
#

class Analytic < ActiveRecord::Base
end

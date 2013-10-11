# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  weight     :decimal(5, 2)
#  user_id    :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

class Weight < ActiveRecord::Base
  belongs_to :user
end

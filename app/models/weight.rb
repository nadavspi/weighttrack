# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  value      :decimal(5, 2)
#  user_id    :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

class Weight < ActiveRecord::Base
  belongs_to :user
  validates :value, :numericality => {:greater_than_or_equal_to => 35.0, :less_than_or_equal_to => 700.0}
  validates :value, :date, presence: true
  default_scope order: 'weights.date DESC'
end

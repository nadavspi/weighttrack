# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string(255)      not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  time_zone          :string(255)
#

class User < ActiveRecord::Base
  include Clearance::User
  has_many :weights

  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
end

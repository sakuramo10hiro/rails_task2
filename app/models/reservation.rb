class Reservation < ApplicationRecord
  validates :end_date, presence:true
  validates :start_date, presence:true
  validates :people_number, presence: true, numericality: true#数値のみか検証
  
  
  belongs_to :user
  belongs_to :room
end

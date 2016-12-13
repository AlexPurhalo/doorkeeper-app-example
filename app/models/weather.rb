class Weather < ApplicationRecord
  belongs_to :user
  validates :name, :temps, :pressure, :humidities, :lon, :lat, presence: true
end

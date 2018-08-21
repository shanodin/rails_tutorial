class Room < ApplicationRecord
  has_many(:resident)
end

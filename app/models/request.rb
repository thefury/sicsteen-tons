class Request < ActiveRecord::Base
  validates :floor, numericality: { only_integer: true, greater_than: 0, less_than: 6 }, presence: true
end

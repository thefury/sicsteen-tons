class Request < ActiveRecord::Base
  validates :floor,
            presence: true,
            inclusion: { in: %w[b 1 2 3 4 5] }

  scope :active, -> { where(deleted: false) }
end

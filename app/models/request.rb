class Request < ActiveRecord::Base
  FLOORS = %w[b 1 2 3 4 5]

  validates :floor,
            presence: true,
            inclusion: { in: FLOORS }

  scope :active, -> { where(deleted: false) }



  def self.active_by_floor
    FLOORS.map{|floor| Request.active.where(floor: floor).order(created_at: :asc)}
  end
end

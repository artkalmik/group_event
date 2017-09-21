class Event < ApplicationRecord

  validates :title, :description, :start_date, :end_date, :location, presence: true
  validates :title, uniqueness: true
  validate :start_date_before_end_date

  default_scope { where(is_actual: true) }

  after_validation :calculate_duration, on: [ :create, :update ]

  private

  def start_date_before_end_date
    return unless has_time_limits?
    if self.end_date < self.start_date
      errors.add :end_date, "should be after start date"
    end
  end

  def calculate_duration
    return unless has_time_limits?
    self.duration = (self.end_date - self.start_date).to_i / 1.day
  end

  def has_time_limits?
    # for validation tests
    self.end_date && self.start_date
  end
end

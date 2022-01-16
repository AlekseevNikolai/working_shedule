class Workday < ApplicationRecord
  belongs_to :user
  validates :date, presence: true

  def start_time
    self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

end

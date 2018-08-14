class Cat < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :color, presence: true
  validates :sex, presence: true

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy

  def current_reservations
    self.rental_requests.order(:start_date).reject { |r| r.status == 'DENIED' }
  end

  def age
    Time.now.year - self.birth_date.year
  end

end

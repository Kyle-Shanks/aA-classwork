class CatRentalRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validate :valid_date_range
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: 'Cat'

  def pending?
    self.status == 'PENDING'
  end

  def approved?
    self.status == 'APPROVED'
  end

  def approve!
    self.status = 'APPROVED'
    if self.save
      id_arr = self.overlapping_pending_requests.map(&:id)
      CatRentalRequest.where(id: id_arr).update_all(status: 'DENIED')
    else
      self.status = 'PENDING'
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save
  end

  def overlapping_requests
    other_requests = Cat.find(self.cat_id).rental_requests

    overlap_requests_arr = []

    other_requests.each do |req|
      unless (self.start_date > req.end_date) || (req.start_date > self.end_date)
        overlap_requests_arr << req
      end
    end

    overlap_requests_arr - [self]
  end

  def overlapping_pending_requests
    overlapping_requests.select(&:pending?)
  end

  def valid_date_range
    check = self.start_date <= self.end_date
    self.errors[:start_date] << "must come before end date" unless check
  end

  def does_not_overlap_approved_request
    arr = overlapping_requests.select(&:approved?)
    self.errors[:start_date] << "cannot overlap with other rentals" unless arr.empty?
  end

end

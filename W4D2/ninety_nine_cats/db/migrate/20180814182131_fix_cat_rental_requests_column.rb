class FixCatRentalRequestsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :cat_rental_requests, :status
    add_column :cat_rental_requests, :status, :string, default: 'PENDING',
      inclusion: { in: %w(PENDING APPROVED DENIED) }, message: '%{value} is not a valid status'
  end
end

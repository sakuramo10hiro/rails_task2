class AddReservationPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reservation_price, :integer
  end
end

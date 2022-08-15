class ChangeColumnsAddNotnullOnReservations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reservations, :start_date, false
    change_column_null :reservations, :end_date, false
    change_column_null :reservations, :people_number, false
  end
end

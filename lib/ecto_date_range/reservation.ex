defmodule EctoDateRange.Reservation do
  use Ecto.Schema

  schema "reservations" do
    field :room_name, :string
    field :during, EctoDateRange.DateRange
  end
end

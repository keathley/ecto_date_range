defmodule EctoDateRange.Reservation do
  use Ecto.Schema

  schema "reservations" do
    field :room_name, :string
    field :during, :tsrange
  end
end

defmodule EctoDateRange.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reservations" do
    field :room_name, :string
    field :during, EctoDateRange.DateRange
  end

  def changeset(reservation, params \\ %{}) do
    reservation
    |> cast(params, [:room_name, :during])
    |> validate_required([:room_name, :during])
    |> exclusion_constraint(:during, name: "no_overlap", message: "Reservations can't overlap")
  end
end

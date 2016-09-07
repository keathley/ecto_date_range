defmodule EctoDateRange.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION btree_gist"

    create table(:reservations) do
      add :room_name, :string
      add :during, :tsrange
    end

    # EXCLUDE USING gist (room WITH =, during WITH &&)
    create constraint(:reservations, :no_overlap, exclude: ~s|gist (room_name WITH =, during WITH &&)|)
  end
end

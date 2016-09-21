defmodule EctoDateRange.DateRangeTest do
  use ExUnit.Case, async: true

  alias EctoDateRange.{DateRange, Reservation, Repo}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EctoDateRange.Repo)
  end

  test "type/0" do
    assert DateRange.type == :tsrange
  end

  test "works with changesets" do
    {:ok, result} =
      %Reservation{}
      |> Reservation.changeset(%{room_name: "abc", during: %{start_date: "2016-01-03 00:00:00", end_date: "2016-01-04 00:00:00"}})
      |> Repo.insert

    assert result

    {:error, changeset} =
      %Reservation{}
      |> Reservation.changeset(%{room_name: "abc", during: %{start_date: "2016-01-03 12:00:00", end_date: "2016-01-05 00:00:00"}})
      |> Repo.insert

    refute changeset.valid?
  end

  describe "cast/1" do
    test "accepts date ranges" do
      dr = %DateRange{start_date: nil, end_date: nil}
      assert DateRange.cast(dr) == dr
    end

    test "accepts strings" do
      start_date = "2016-02-09 03:22:02"
      end_date = "2016-02-10 03:22:02"
      dr = %{start_date: start_date, end_date: end_date}
      assert DateRange.cast(dr) == {:ok, %DateRange{
        start_date: Ecto.DateTime.cast!(start_date),
        end_date: Ecto.DateTime.cast!(end_date),
      }}
    end

    test "other types return an error" do
      assert DateRange.cast(:foo) == :error
    end
  end
end

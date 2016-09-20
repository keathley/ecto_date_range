defmodule EctoDateRange.DateRange do
  @behaviour Ecto.Type

  @type t :: %__MODULE__{
    start_date: Ecto.DateTime.t,
    end_date: Ecto.DateTime.t,
  }
  @type tsrange :: :tsrange
  @type db_type :: any()

  alias __MODULE__

  defstruct [start_date: nil, end_date: nil]

  def type, do: :tsrange

  @spec cast(any()) :: DateRange.t | :error
  def cast(%DateRange{}=range), do: range

  def cast(%{end_date: end_date, start_date: start_date}) do
    with {:ok, start_date_ecto} <- Ecto.DateTime.cast(start_date),
         {:ok, end_date_ecto} <- Ecto.DateTime.cast(end_date),
      do: {:ok, %DateRange{start_date: start_date_ecto, end_date: end_date_ecto}}
  end

  def cast(_), do: :error

  @spec load(tsrange) :: DateRange.t
  def load(%Postgrex.Range{lower: start_date, upper: end_date}) do
    {:ok, %DateRange{start_date: Ecto.DateTime.load(start_date), end_date: Ecto.DateTime.load(end_date)}}
  end


  @spec dump(DateRange.t) :: db_type
  def dump(%{start_date: start_date, end_date: end_date}) do
    IO.puts "Dumping"
    IO.inspect(start_date)
    IO.inspect(end_date)
    {:ok, %Postgrex.Range{lower: start_date, upper: end_date}}
  end

  def dump(_), do: :error
end

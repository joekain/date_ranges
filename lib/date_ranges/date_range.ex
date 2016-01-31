defmodule DateRanges.DateRange do
  use Ecto.Schema

  schema "date_ranges" do
    field :start, Ecto.Date
    field :end, Ecto.Date

    timestamps
  end
end

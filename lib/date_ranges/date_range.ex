defmodule DateRanges.DateRange do
  use Ecto.Schema
  import Ecto.Query, only: [from: 1, from: 2]

  schema "date_ranges" do
    field :start, DateRanges.CustomDate
    field :end, DateRanges.CustomDate

    timestamps
  end

  def overlapping(target) do
    from range in DateRanges.DateRange, where: fragment("(?, ?) OVERLAPS (?, ?)",
               range.start, range.end, type(^target.start, Ecto.Date), type(^target.end, Ecto.Date))
  end
end

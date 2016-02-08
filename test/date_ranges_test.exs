defmodule DateRangesTest do
  use ExUnit.Case
  doctest DateRanges
  alias DateRanges.DateRange

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "it can build a changeset" do
    changeset = Ecto.Changeset.cast(%DateRange{},
                  %{start: "2/9/2016", end: "5/9/2016"},
                  ~w(start end), ~w())
    assert changeset.errors == []
  end
end

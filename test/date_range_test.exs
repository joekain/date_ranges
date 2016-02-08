defmodule DateRangeTest do
  use ExUnit.Case

  alias DateRanges.Repo
  alias DateRanges.DateRange
  alias DateRanges.CustomDate

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(DateRanges.Repo, [])
    end

    seed

    :ok
  end

  test "It can query overlapping ranges" do
    {:ok, s} = CustomDate.cast("4/18/2016")
    {:ok, e} = CustomDate.cast("4/22/2016")
    target = %DateRange{
      start: s,
      end: e,
    }
    |> IO.inspect

    expected = %DateRange {
      start: Ecto.Date.from_erl({2016, 4, 21}),
      end: Ecto.Date.from_erl({2016, 4, 25})
    }

    result = target
    |> DateRange.overlapping
    |> Repo.one

    assert result.start == expected.start
    assert result.end == expected.end
  end

  def seed do
    ranges = [
      {{2016, 1, 31}, {2016, 2, 12}},
      {{2016, 2,  1}, {2016, 2,  4}},
      {{2016, 2,  3}, {2016, 2,  4}},
      {{2016, 2, 12}, {2016, 2, 16}},
      {{2016, 2, 28}, {2016, 3, 10}},
      {{2016, 3,  3}, {2016, 3,  7}},
      {{2016, 4,  1}, {2016, 4,  9}},
      {{2016, 4,  6}, {2016, 4, 12}},
      {{2016, 4, 21}, {2016, 4, 25}},
      {{2016, 5,  1}, {2016, 5,  5}},
      {{2016, 5,  7}, {2016, 5,  8}},
      {{2016, 5,  8}, {2016, 5,  8}},
    ]

    Enum.each ranges, fn {s, e} ->
      Repo.insert! %DateRange{
        start: Ecto.Date.from_erl(s),
        end: Ecto.Date.from_erl(e)
      }
    end
  end
end

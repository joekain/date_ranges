defmodule CustomDateTest do
  use ExUnit.Case

  alias DateRanges.CustomDate

  test "it can convert the MM/DD/YYYY format to a date" do
    assert CustomDate.cast("2/9/2016") == Ecto.Date.cast("2016-02-09")
  end

  test "it should accept Ecto.Date" do
    {:ok, ed} = Ecto.Date.cast("2016-02-09")
    assert match?({:ok, _}, CustomDate.cast(ed))
  end

  test "it should accept date tuples" do
    assert CustomDate.cast({2016, 2, 9}) == Ecto.Date.cast("2016-02-09")
  end

  test "it should dump dates" do
    {:ok, ed} = Ecto.Date.cast("2016-02-09")
    assert CustomDate.dump(ed) == {:ok, {2016, 2, 9}}
  end

  test "it loads dates" do
    assert CustomDate.load({2016, 2, 9}) == Ecto.Date.cast("2016-02-09")
  end
end

defmodule DateRanges.CustomDate do
  @behaviour Ecto.Type

  def type, do: Ecto.Date

  def cast(string) when is_binary(string) do
    case Regex.run(~r/^([0-9]+)\/([0-9]+)\/([0-9]+)$/, string) do
      [_match, m, d, y] -> Ecto.Date.cast {y, m, d}
      nil -> :error
    end
  end
  def cast(date), do: Ecto.Date.cast(date)

  defdelegate dump(x), to: Ecto.Date
  defdelegate load(x), to: Ecto.Date
end

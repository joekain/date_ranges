defmodule DateRanges.Repo.Migrations.AddDateRanges do
  use Ecto.Migration

  def change do
    create table(:date_ranges) do
      add :start, :date
      add :end, :date

      timestamps 
    end
  end
end

defmodule Database.Repo.Migrations.CreateTours do
  use Ecto.Migration

  def change do
    create table(:tours) do
      add :name, :string
      add :complexity, :integer
      add :minimum_age, :string
      add :kids_age_rate, :string
      add :what_to_know, :text
      add :what_to_take, :text
      add :includes, :text
      add :does_not_include, :text
      add :short_description, :text
      add :long_description, :text
      add :recommendations, :text
      add :points_of_interest, :text
      add :notes, :text

      timestamps()
    end
  end
end

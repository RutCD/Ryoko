defmodule Database.Content.Tour do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tours" do
    field :complexity, ComplexityEnum
    field :does_not_include, :string
    field :includes, :string
    field :kids_age_rate, :string
    field :long_description, :string
    field :minimum_age, :string
    field :name, :string
    field :notes, :string
    field :points_of_interest, :string
    field :recommendations, :string
    field :short_description, :string
    field :what_to_know, :string
    field :what_to_take, :string

    timestamps()
  end

  @doc false
  def changeset(tour, attrs) do
    tour
    |> cast(attrs, [:name, :complexity, :minimum_age, :kids_age_rate, :what_to_know, :what_to_take, :includes, :does_not_include, :short_description, :long_description, :recommendations, :points_of_interest, :notes])
    |> validate_required([:name, :complexity, :minimum_age, :kids_age_rate, :what_to_know, :what_to_take, :includes, :does_not_include, :short_description, :long_description, :recommendations, :points_of_interest, :notes])
  end
end

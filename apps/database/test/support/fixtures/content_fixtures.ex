defmodule Database.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Database.Content` context.
  """

  @doc """
  Generate a tour.
  """
  def tour_fixture(attrs \\ %{}) do
    {:ok, tour} =
      attrs
      |> Enum.into(%{
        complexity: 42,
        does_not_include: "some does_not_include",
        includes: "some includes",
        kids_age_rate: "some kids_age_rate",
        long_description: "some long_description",
        minimum_age: "some minimum_age",
        name: "some name",
        notes: "some notes",
        points_of_interest: "some points_of_interest",
        recommendations: "some recommendations",
        short_description: "some short_description",
        what_to_know: "some what_to_know",
        what_to_take: "some what_to_take"
      })
      |> Database.Content.create_tour()

    tour
  end
end

defmodule Database.ContentTest do
  use Database.DataCase

  alias Database.Content

  describe "tours" do
    alias Database.Content.Tour

    import Database.ContentFixtures

    @invalid_attrs %{complexity: nil, "does-not-include": nil, includes: nil, "kids-age-rate": nil, "long-description": nil, "minimum-age": nil, name: nil, notes: nil, "points-of-interest": nil, recommendations: nil, "short-description": nil, "what-to-know": nil, "what-to-take": nil}

    test "list_tours/0 returns all tours" do
      tour = tour_fixture()
      assert Content.list_tours() == [tour]
    end

    test "get_tour!/1 returns the tour with given id" do
      tour = tour_fixture()
      assert Content.get_tour!(tour.id) == tour
    end

    test "create_tour/1 with valid data creates a tour" do
      valid_attrs = %{complexity: 42, "does-not-include": "some does-not-include", includes: "some includes", "kids-age-rate": "some kids-age-rate", "long-description": "some long-description", "minimum-age": "some minimum-age", name: "some name", notes: "some notes", "points-of-interest": "some points-of-interest", recommendations: "some recommendations", "short-description": "some short-description", "what-to-know": "some what-to-know", "what-to-take": "some what-to-take"}

      assert {:ok, %Tour{} = tour} = Content.create_tour(valid_attrs)
      assert tour.complexity == 42
      assert tour.does-not-include == "some does-not-include"
      assert tour.includes == "some includes"
      assert tour.kids-age-rate == "some kids-age-rate"
      assert tour.long-description == "some long-description"
      assert tour.minimum-age == "some minimum-age"
      assert tour.name == "some name"
      assert tour.notes == "some notes"
      assert tour.points-of-interest == "some points-of-interest"
      assert tour.recommendations == "some recommendations"
      assert tour.short-description == "some short-description"
      assert tour.what-to-know == "some what-to-know"
      assert tour.what-to-take == "some what-to-take"
    end

    test "create_tour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_tour(@invalid_attrs)
    end

    test "update_tour/2 with valid data updates the tour" do
      tour = tour_fixture()
      update_attrs = %{complexity: 43, "does-not-include": "some updated does-not-include", includes: "some updated includes", "kids-age-rate": "some updated kids-age-rate", "long-description": "some updated long-description", "minimum-age": "some updated minimum-age", name: "some updated name", notes: "some updated notes", "points-of-interest": "some updated points-of-interest", recommendations: "some updated recommendations", "short-description": "some updated short-description", "what-to-know": "some updated what-to-know", "what-to-take": "some updated what-to-take"}

      assert {:ok, %Tour{} = tour} = Content.update_tour(tour, update_attrs)
      assert tour.complexity == 43
      assert tour.does-not-include == "some updated does-not-include"
      assert tour.includes == "some updated includes"
      assert tour.kids-age-rate == "some updated kids-age-rate"
      assert tour.long-description == "some updated long-description"
      assert tour.minimum-age == "some updated minimum-age"
      assert tour.name == "some updated name"
      assert tour.notes == "some updated notes"
      assert tour.points-of-interest == "some updated points-of-interest"
      assert tour.recommendations == "some updated recommendations"
      assert tour.short-description == "some updated short-description"
      assert tour.what-to-know == "some updated what-to-know"
      assert tour.what-to-take == "some updated what-to-take"
    end

    test "update_tour/2 with invalid data returns error changeset" do
      tour = tour_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_tour(tour, @invalid_attrs)
      assert tour == Content.get_tour!(tour.id)
    end

    test "delete_tour/1 deletes the tour" do
      tour = tour_fixture()
      assert {:ok, %Tour{}} = Content.delete_tour(tour)
      assert_raise Ecto.NoResultsError, fn -> Content.get_tour!(tour.id) end
    end

    test "change_tour/1 returns a tour changeset" do
      tour = tour_fixture()
      assert %Ecto.Changeset{} = Content.change_tour(tour)
    end
  end

  describe "tours" do
    alias Database.Content.Tour

    import Database.ContentFixtures

    @invalid_attrs %{complexity: nil, does_not_include: nil, includes: nil, kids_age_rate: nil, long_description: nil, minimum_age: nil, name: nil, notes: nil, points_of_interest: nil, recommendations: nil, short_description: nil, what_to_know: nil, what_to_take: nil}

    test "list_tours/0 returns all tours" do
      tour = tour_fixture()
      assert Content.list_tours() == [tour]
    end

    test "get_tour!/1 returns the tour with given id" do
      tour = tour_fixture()
      assert Content.get_tour!(tour.id) == tour
    end

    test "create_tour/1 with valid data creates a tour" do
      valid_attrs = %{complexity: 42, does_not_include: "some does_not_include", includes: "some includes", kids_age_rate: "some kids_age_rate", long_description: "some long_description", minimum_age: "some minimum_age", name: "some name", notes: "some notes", points_of_interest: "some points_of_interest", recommendations: "some recommendations", short_description: "some short_description", what_to_know: "some what_to_know", what_to_take: "some what_to_take"}

      assert {:ok, %Tour{} = tour} = Content.create_tour(valid_attrs)
      assert tour.complexity == 42
      assert tour.does_not_include == "some does_not_include"
      assert tour.includes == "some includes"
      assert tour.kids_age_rate == "some kids_age_rate"
      assert tour.long_description == "some long_description"
      assert tour.minimum_age == "some minimum_age"
      assert tour.name == "some name"
      assert tour.notes == "some notes"
      assert tour.points_of_interest == "some points_of_interest"
      assert tour.recommendations == "some recommendations"
      assert tour.short_description == "some short_description"
      assert tour.what_to_know == "some what_to_know"
      assert tour.what_to_take == "some what_to_take"
    end

    test "create_tour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_tour(@invalid_attrs)
    end

    test "update_tour/2 with valid data updates the tour" do
      tour = tour_fixture()
      update_attrs = %{complexity: 43, does_not_include: "some updated does_not_include", includes: "some updated includes", kids_age_rate: "some updated kids_age_rate", long_description: "some updated long_description", minimum_age: "some updated minimum_age", name: "some updated name", notes: "some updated notes", points_of_interest: "some updated points_of_interest", recommendations: "some updated recommendations", short_description: "some updated short_description", what_to_know: "some updated what_to_know", what_to_take: "some updated what_to_take"}

      assert {:ok, %Tour{} = tour} = Content.update_tour(tour, update_attrs)
      assert tour.complexity == 43
      assert tour.does_not_include == "some updated does_not_include"
      assert tour.includes == "some updated includes"
      assert tour.kids_age_rate == "some updated kids_age_rate"
      assert tour.long_description == "some updated long_description"
      assert tour.minimum_age == "some updated minimum_age"
      assert tour.name == "some updated name"
      assert tour.notes == "some updated notes"
      assert tour.points_of_interest == "some updated points_of_interest"
      assert tour.recommendations == "some updated recommendations"
      assert tour.short_description == "some updated short_description"
      assert tour.what_to_know == "some updated what_to_know"
      assert tour.what_to_take == "some updated what_to_take"
    end

    test "update_tour/2 with invalid data returns error changeset" do
      tour = tour_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_tour(tour, @invalid_attrs)
      assert tour == Content.get_tour!(tour.id)
    end

    test "delete_tour/1 deletes the tour" do
      tour = tour_fixture()
      assert {:ok, %Tour{}} = Content.delete_tour(tour)
      assert_raise Ecto.NoResultsError, fn -> Content.get_tour!(tour.id) end
    end

    test "change_tour/1 returns a tour changeset" do
      tour = tour_fixture()
      assert %Ecto.Changeset{} = Content.change_tour(tour)
    end
  end
end

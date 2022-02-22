defmodule Admin.TourControllerTest do
  use Admin.ConnCase

  import Database.ContentFixtures

  @create_attrs %{complexity: 42, does_not_include: "some does_not_include", includes: "some includes", kids_age_rate: "some kids_age_rate", long_description: "some long_description", minimum_age: "some minimum_age", name: "some name", notes: "some notes", points_of_interest: "some points_of_interest", recommendations: "some recommendations", short_description: "some short_description", what_to_know: "some what_to_know", what_to_take: "some what_to_take"}
  @update_attrs %{complexity: 43, does_not_include: "some updated does_not_include", includes: "some updated includes", kids_age_rate: "some updated kids_age_rate", long_description: "some updated long_description", minimum_age: "some updated minimum_age", name: "some updated name", notes: "some updated notes", points_of_interest: "some updated points_of_interest", recommendations: "some updated recommendations", short_description: "some updated short_description", what_to_know: "some updated what_to_know", what_to_take: "some updated what_to_take"}
  @invalid_attrs %{complexity: nil, does_not_include: nil, includes: nil, kids_age_rate: nil, long_description: nil, minimum_age: nil, name: nil, notes: nil, points_of_interest: nil, recommendations: nil, short_description: nil, what_to_know: nil, what_to_take: nil}

  describe "index" do
    test "lists all tours", %{conn: conn} do
      conn = get(conn, Routes.tour_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Tours"
    end
  end

  describe "new tour" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tour_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tour"
    end
  end

  describe "create tour" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tour_path(conn, :create), tour: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tour_path(conn, :show, id)

      conn = get(conn, Routes.tour_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tour"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tour_path(conn, :create), tour: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tour"
    end
  end

  describe "edit tour" do
    setup [:create_tour]

    test "renders form for editing chosen tour", %{conn: conn, tour: tour} do
      conn = get(conn, Routes.tour_path(conn, :edit, tour))
      assert html_response(conn, 200) =~ "Edit Tour"
    end
  end

  describe "update tour" do
    setup [:create_tour]

    test "redirects when data is valid", %{conn: conn, tour: tour} do
      conn = put(conn, Routes.tour_path(conn, :update, tour), tour: @update_attrs)
      assert redirected_to(conn) == Routes.tour_path(conn, :show, tour)

      conn = get(conn, Routes.tour_path(conn, :show, tour))
      assert html_response(conn, 200) =~ "some updated does_not_include"
    end

    test "renders errors when data is invalid", %{conn: conn, tour: tour} do
      conn = put(conn, Routes.tour_path(conn, :update, tour), tour: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tour"
    end
  end

  describe "delete tour" do
    setup [:create_tour]

    test "deletes chosen tour", %{conn: conn, tour: tour} do
      conn = delete(conn, Routes.tour_path(conn, :delete, tour))
      assert redirected_to(conn) == Routes.tour_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.tour_path(conn, :show, tour))
      end
    end
  end

  defp create_tour(_) do
    tour = tour_fixture()
    %{tour: tour}
  end
end

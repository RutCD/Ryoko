defmodule Admin.TourController do
  use Admin, :controller

  alias Database.Content
  alias Database.Content.Tour

  def index(conn, _params) do
    tours = Content.list_tours()
    render(conn, "index.html", tours: tours)
  end

  def new(conn, _params) do
    changeset = Content.change_tour(%Tour{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tour" => tour_params}) do
    case Content.create_tour(tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour created successfully.")
        |> redirect(to: Routes.tour_path(conn, :show, tour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tour = Content.get_tour!(id)
    render(conn, "show.html", tour: tour)
  end

  def edit(conn, %{"id" => id}) do
    tour = Content.get_tour!(id)
    changeset = Content.change_tour(tour)
    render(conn, "edit.html", tour: tour, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tour" => tour_params}) do
    tour = Content.get_tour!(id)

    case Content.update_tour(tour, tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour updated successfully.")
        |> redirect(to: Routes.tour_path(conn, :show, tour))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tour: tour, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tour = Content.get_tour!(id)
    {:ok, _tour} = Content.delete_tour(tour)

    conn
    |> put_flash(:info, "Tour deleted successfully.")
    |> redirect(to: Routes.tour_path(conn, :index))
  end
end

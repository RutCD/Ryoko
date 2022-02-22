defmodule Admin.ViewHelpers do
  @moduledoc """
    Admin View helpers
  """
  
  def enum_options(enum) do
    enum.__enum_map__()
    |> Enum.map(fn {key, _} ->
      formatted_key =
        key
        |> Atom.to_string()
        |> String.split("_")
        |> Enum.join(" ")
        |> String.capitalize()

      {formatted_key, key}
    end)
  end
end

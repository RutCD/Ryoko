defmodule Admin.TourView do
  use Admin, :view
  import Admin.ViewHelpers, only: [enum_options: 1]

  def complexity_enum, do: ComplexityEnum |> enum_options
end

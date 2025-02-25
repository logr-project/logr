defmodule LogrWeb.ErrorJSONTest do
  use LogrWeb.ConnCase, async: true

  test "renders 404" do
    assert LogrWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LogrWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

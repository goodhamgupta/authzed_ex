defmodule AuthzedExTest do
  use ExUnit.Case
  doctest AuthzedEx

  test "greets the world" do
    assert AuthzedEx.hello() == :world
  end
end

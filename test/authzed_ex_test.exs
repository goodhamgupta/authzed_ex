defmodule AuthzedTest do
  use ExUnit.Case
  doctest Authzed

  test "greets the world" do
    assert Authzed.hello() == :world
  end
end

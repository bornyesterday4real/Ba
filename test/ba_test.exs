defmodule BaTest do
  use ExUnit.Case
  doctest Ba

  test "greets the world" do
    assert Ba.hello() == :world
  end
end

defmodule ElStoreTest do
  use ExUnit.Case
  doctest ElStore

  test "greets the world" do
    assert ElStore.hello() == :world
  end
end

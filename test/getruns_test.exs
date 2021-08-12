defmodule GetRunsTest do
  use ExUnit.Case
  doctest Jasprit

  test "dot ball results in 0 runs" do
    assert Jasprit.getRuns(:dot) == 0
  end

  test "single results in 1 run" do
    assert Jasprit.getRuns(:single) == 1
  end

  test "double results in 2 runs" do
    assert Jasprit.getRuns(:double) == 2
  end

  test "triple results in 3 runs" do
    assert Jasprit.getRuns(:triple) == 3
  end

  test "boundary results in 4 runs" do
    assert Jasprit.getRuns(:boundary) == 4
  end

  test "maximum results in 6 runs" do
    assert Jasprit.getRuns(:maximum) == 6
  end

  test "arbitrary runs are handled" do
    runs = :rand.uniform(100)
    assert Jasprit.getRuns(runs) == runs
  end
end

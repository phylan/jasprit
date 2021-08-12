defmodule GenerateBallTest do
  use ExUnit.Case
  doctest Jasprit

  test "generate ball produces an outcome" do
    ball = Jasprit.generateBall(%{})
    assert Enum.member?([:wicket, :dot, :single, :double, :triple, :boundary, :maximum], ball)
  end
end
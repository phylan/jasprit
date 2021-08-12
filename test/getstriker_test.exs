defmodule GetStrikerTest do
  use ExUnit.Case
  doctest Jasprit

  test "dot ball leaves striker unchanged" do
    striker = :striker
    nonstriker = :nonstriker
    { striker, nonstriker } = Jasprit.getStriker(striker, nonstriker, 0)
    assert { striker, nonstriker } == { :striker, :nonstriker }
  end

  test "single changes striker" do
    striker = :striker
    nonstriker = :nonstriker
    { striker, nonstriker } = Jasprit.getStriker(striker, nonstriker, 1)
    assert { striker, nonstriker } == { :nonstriker, :striker }
  end

  test "double leaves striker unchanged" do
    striker = :striker
    nonstriker = :nonstriker
    { striker, nonstriker } = Jasprit.getStriker(striker, nonstriker, 2)
    assert { striker, nonstriker } == { :striker, :nonstriker }
  end

  test "triple changes striker" do
    striker = :striker
    nonstriker = :nonstriker
    { striker, nonstriker } = Jasprit.getStriker(striker, nonstriker, 3)
    assert { striker, nonstriker } == { :nonstriker, :striker }
  end

  test "boundary leave striker unchanged" do
    striker = :striker
    nonstriker = :nonstriker
    { striker, nonstriker } = Jasprit.getStriker(striker, nonstriker, 4)
    assert { striker, nonstriker } == { :striker, :nonstriker }
  end

  test "maximum leaves striker unchanged" do
    striker = :striker
    nonstriker = :nonstriker
    { striker, nonstriker } = Jasprit.getStriker(striker, nonstriker, 6)
    assert { striker, nonstriker } == { :striker, :nonstriker }
  end
end

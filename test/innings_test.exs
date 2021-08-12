defmodule InningsTest do
  use ExUnit.Case
  doctest Jasprit

  test "10 wickets changes innings" do
    { format, wickets, balls } = { Enum.random([:test, :odi, :t20, :hundred]), 10, :rand.uniform(1000) }
    assert Jasprit.checkInningsChange(format, wickets, balls)
  end

  test "300 balls changes innings in odi" do
    { format, wickets, balls } = { :odi, :rand.uniform(9), 300 }
    assert Jasprit.checkInningsChange(format, wickets, balls)
  end

  test "less than 300 balls does not change innings in odi" do
    { format, wickets, balls } = { :odi, :rand.uniform(9), :rand.uniform(299) }
    assert !Jasprit.checkInningsChange(format, wickets, balls)
  end

  test "120 balls changes innings in t20" do
    { format, wickets, balls } = { :t20, :rand.uniform(9), 120 }
    assert Jasprit.checkInningsChange(format, wickets, balls)
  end

  test "less than 120 balls does not change innings in t20" do
    { format, wickets, balls } = { :t20, :rand.uniform(9), :rand.uniform(119) }
    assert !Jasprit.checkInningsChange(format, wickets, balls)
  end

  test "100 balls changes innings in 100-ball" do
    { format, wickets, balls } = { :hundred, :rand.uniform(9), 100 }
    assert Jasprit.checkInningsChange(format, wickets, balls)
  end

  test "less than 100 balls does not change innings in 100-ball" do
    { format, wickets, balls } = { :hundred, :rand.uniform(9), :rand.uniform(99) }
    assert !Jasprit.checkInningsChange(format, wickets, balls)
  end
end

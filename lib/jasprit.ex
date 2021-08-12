defmodule Jasprit do
  @moduledoc """
  Documentation for `Jasprit`.
  """

  @doc """
  Returns striker and nonstriker in partnership based on runs scored on a ball
  """
  def getStriker(striker, nonstriker, runs) when runs == 0 or rem(runs, 2) == 0 do { striker, nonstriker } end

  def getStriker(striker, nonstriker, _) do { nonstriker, striker } end

  @doc """
  Returns number of runs earned from the result passed as an argument
  """
  def getRuns(result) do
    case result do
      :dot -> 0
      :single -> 1
      :double -> 2
      :triple -> 3
      :boundary -> 4
      :maximum -> 6
      :wicket -> 0
      :bye -> 1
      :legbye -> 1
      :wide -> 1
      :noball -> 0
      _ -> result
    end
  end

  def getAverages() do
    %{
      :dot => 423,
      :single => 302,
      :double => 121,
      :triple => 2,
      :boundary => 79,
      :maximum => 25,
      :wicket => 17,
      :bye => 8,
      :legbye => 10,
      :wide => 4,
      :noball => 5
    }
  end

  @doc"""
  Get number of wickets
  """
  def countWickets(balls) do
    balls
    |> Enum.filter(fn(x) -> x == :wicket end)
    |> Enum.count
  end

  @doc"""
  Get number of runs
  """
  def countRuns(balls) do
    balls
    |> Enum.map(fn(x) -> getRuns(x) end)
    |> Enum.sum
  end

  @doc"""
  Returns true if an innings change is required for the format, balls, and wicket passed as arguments
  """
  def checkInningsChange(_, wickets, _) when wickets > 9 do true end

  def checkInningsChange(:test, wickets, _) when wickets < 10 do false end

  def checkInningsChange(format, _, balls) do
    ballLimit = case format do
      :odi -> 300
      :t20 -> 120
      :hundred -> 100
    end

    if balls >= ballLimit do
      true
    end
  end

  @doc"""
  Receives outcome probability map as argument and produces a ball result
  """
  def generateBall() do
      Jasprit.getAverages()
      |> Enum.map(fn ({outcome, weight}) -> { outcome, weight } end)
      |> WeightedChoice.weight_based_choice()
  end

  @doc"""
  Play innings
  """
  def playInnings(balls, format) do
    balls = [generateBall() | balls]

    if !checkInningsChange(format, countWickets(balls), Enum.count(balls))
      do
      playInnings(balls, format)
    else
      balls
    end
  end

  @doc"""
  Play match
  """

  def playMatch(:test, innings) when length(innings) == 4 do
    innings
  end

  def playMatch(format, innings) when length(innings) == 2 and format != :test do
    innings
  end

  def playMatch(format, innings) do
    playMatch(format, [ playInnings([], format) | innings ])
  end

  @doc"""
  Calculate outcome probability via log 5
  """
  def log5() do
    
  end

end

defmodule WeightedChoice do
#  shamelesly lifted from https://elixirforum.com/t/weight-based-random-sampling/23345/2

  @moduledoc false
  def weight_based_choice(items) do
    value =
      items
      |> sum_weights(0)
      |> :rand.uniform()

    select_item(items, value, 0)
  end

  defp select_item([{name, _}], _, _) do
    name
  end

  defp select_item([{name, weight} | tail], value, acc) do
    acc = acc + weight

    if acc > value do
      name
    else
      select_item(tail, value, acc)
    end
  end

  defp sum_weights([], sum),
       do: sum

  defp sum_weights([{_, weight} | tail], sum),
       do: sum_weights(tail, sum + weight)
end

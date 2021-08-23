defmodule EdwinInterview do
  @moduledoc """
  Documentation for `EdwinInterview`.
  """

  def calc(users, products, probability_matrix) do
    get_permutations(users, products)
    |> Enum.map(&sum_permutation(&1, probability_matrix))
    |> Enum.max()
  end

  def calc_with_permutation(users, products, probability_matrix) do
    {max, best_permutation} =
      get_permutations(users, products)
      |> Enum.reduce({0, nil}, fn current_permutation, {prev_max, prev_best} ->
        current_sum = sum_permutation(current_permutation, probability_matrix)

        if current_sum > prev_max do
          {current_sum, current_permutation}
        else
          {prev_max, prev_best}
        end
      end)

    {max, best_permutation}
  end

  defp get_permutations(users, products) do
    1..length(users)
    |> Enum.to_list()
    |> Permutations.permute(length(products))
  end

  defp sum_permutation(permutation, probability_matrix) do
    permutation
    |> Enum.with_index()
    |> Enum.map(fn {user_index, product_index} ->
      probability_matrix
      |> Enum.at(user_index - 1)
      |> Enum.at(product_index - 1)
    end)
    |> Enum.sum()
    |> Float.round(2)
  end
end

defmodule Permutations do
  def permute([], _), do: [[]]
  def permute(_, 0), do: [[]]
  def permute(list, i), do: for(x <- list, y <- permute(list -- [x], i - 1), do: [x | y])
end

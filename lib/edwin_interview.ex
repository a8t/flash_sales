defmodule EdwinInterview do
  @moduledoc """
  Documentation for `EdwinInterview`.
  """

  def calc(users, products, probability_matrix) do
    users = 1..length(users) |> Enum.to_list()

    permutations = Permutations.subset(users, length(products))

    permutations
    |> Enum.map(fn permutation ->
      permutation
      |> Enum.with_index()
      |> Enum.map(fn {user_index, product_index} ->
        probability_matrix
        |> Enum.at(user_index - 1)
        |> Enum.at(product_index - 1)
      end)
      |> Enum.sum()
    end)
    |> Enum.max()
  end
end

defmodule Permutations do
  def subset([], _), do: [[]]
  def subset(_, 0), do: [[]]

  def subset(list, i) do
    for x <- list, y <- subset(list, i - 1), do: [x | y]
  end
end

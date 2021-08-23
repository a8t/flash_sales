defmodule FlashSalesTest do
  use ExUnit.Case, async: true
  doctest FlashSales

  # IO.inspect(for _num <- 1..16, do: for(_num <- 1..6, do: :rand.uniform(100) / 100))

  test "greets the world" do
    probability_matrix = [
      [0.92, 0.13, 0.57, 0.18],
      [0.64, 0.23, 0.57, 0.97],
      [0.83, 0.33, 0.38, 0.16],
      [0.22, 0.76, 0.21, 0.1],
      [0.23, 0.06, 0.08, 0.49],
      [0.08, 0.68, 0.44, 0.75],
      [0.96, 0.81, 0.14, 0.84],
      [0.46, 0.42, 0.28, 0.71],
      [0.46, 0.72, 0.43, 0.07],
      [0.92, 0.74, 0.78, 0.24],
      [0.35, 0.90, 0.86, 0.76],
      [0.47, 0.15, 0.58, 0.93],
      [0.09, 0.56, 0.76, 0.09],
      [0.35, 0.87, 0.54, 0.73],
      [0.39, 0.52, 0.01, 0.62],
      [0.43, 0.68, 0.1, 0.44]
    ]

    sum = (0.96 + 0.87 + 0.86 + 0.97) |> Float.round(2)

    assert FlashSales.get_max_expected_value(
             list_up_to(length(probability_matrix)),
             list_up_to(length(Enum.at(probability_matrix, 0))),
             probability_matrix
           ) ==
             sum
  end

  test "tests" do
    probability_matrix = [
      [0.2, 0.95, 0.3],
      [0.2, 0.95, 0.3],
      [0.2, 0.95, 0.3],
      [0.2, 0.95, 0.3]
    ]

    sum = (0.95 + 0.2 + 0.3) |> Float.round(2)

    assert FlashSales.get_max_expected_value(
             list_up_to(length(probability_matrix)),
             list_up_to(length(Enum.at(probability_matrix, 0))),
             probability_matrix
           ) ==
             sum
  end

  test "tests 2" do
    probability_matrix = [
      [0.77, 0.42, 0.27, 0.12, 0.53, 0.04],
      [0.40, 0.33, 0.28, 0.95, 0.69, 0.07],
      [0.91, 0.71, 0.27, 0.99, 1.00, 0.16],
      [0.65, 0.35, 0.19, 0.55, 0.01, 0.67],
      [0.53, 0.02, 0.71, 0.03, 0.11, 0.63],
      [0.26, 0.28, 0.72, 0.52, 0.31, 0.70],
      [0.90, 0.56, 0.35, 0.17, 0.16, 0.72],
      [0.42, 0.51, 0.16, 0.83, 0.68, 0.12],
      [0.51, 0.34, 0.12, 0.50, 0.70, 0.82],
      [0.69, 0.89, 0.28, 0.24, 0.24, 0.83],
      [0.53, 0.42, 0.76, 0.78, 0.07, 0.07],
      [0.24, 0.06, 0.03, 0.10, 0.84, 0.04],
      [0.35, 0.22, 0.13, 0.15, 0.12, 0.39],
      [0.56, 0.08, 0.30, 0.72, 0.49, 0.33],
      [0.33, 0.20, 0.15, 0.42, 0.21, 0.60],
      [0.74, 0.25, 0.54, 0.83, 0.80, 0.33]
    ]

    sum = (0.9 + 0.89 + 0.76 + 0.95 + 1.0 + 0.82) |> Float.round(2)

    assert FlashSales.get_max_expected_value(
             list_up_to(length(probability_matrix)),
             list_up_to(length(Enum.at(probability_matrix, 0))),
             probability_matrix
           ) ==
             sum
  end

  defp list_up_to(number), do: 1..number |> Enum.to_list()
end

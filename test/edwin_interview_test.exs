defmodule EdwinInterviewTest do
  use ExUnit.Case
  doctest EdwinInterview

  @ok [
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
    [0.35, 0.9, 0.86, 0.76],
    [0.47, 0.15, 0.58, 0.93],
    [0.09, 0.56, 0.76, 0.09],
    [0.35, 0.87, 0.54, 0.73],
    [0.39, 0.52, 0.01, 0.62],
    [0.43, 0.68, 0.1, 0.44]
  ]

  @sum (0.96 + 0.90 + 0.86 + 0.97) |> Float.round(2)

  # IO.inspect(for _num <- 1..16, do: for(_num <- 1..4, do: :rand.uniform(100) / 100))

  test "greets the world" do
    IO.inspect(for _num <- 1..4, do: for(_num <- 1..16, do: :rand.uniform(100) / 100))

    assert EdwinInterview.calc(1..16 |> Enum.to_list(), 1..4 |> Enum.to_list(), @ok) == @sum
  end
end

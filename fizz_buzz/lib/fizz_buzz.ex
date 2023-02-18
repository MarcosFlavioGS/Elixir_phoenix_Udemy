defmodule FizzBuzz do
  def build(file_name) do
  file_name
  |> File.read()
  |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&fizz_buzz/1)
      {:ok, result}
  end

  defp handle_file({:error, reason}), do: {:error, "Error reading file: #{reason}"}

  defp fizz_buzz(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :FizzBuzz
  defp fizz_buzz(number) when rem(number, 3) == 0, do: :Fizz
  defp fizz_buzz(number) when rem(number, 5) == 0, do: :Buzz
  defp fizz_buzz(number), do: number
end

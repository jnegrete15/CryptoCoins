defmodule CryptoCoins do
  def coin(coins, name) when is_binary(name) do
    coins
    |> Enum.find(fn %{"name" => coin_name, "symbol" => symbol} ->
      name == coin_name or name == symbol
    end)
  end

  def most_valuable(coins) do
    coins
    |> Enum.max_by(fn %{"price" => price} -> String.to_float(price) end)
  end

  def most_capped(coins) do
    coins
    |> Enum.max_by(fn %{"marketCap" => marketCap} -> marketCap end)
  end

  def most_ranked(coins) do
    coins
    |> Enum.max_by(fn %{"rank" => rank} -> rank end)
  end

  def sort_by(coins, field \\ "rank") do
    coins
    |> Enum.sort_by(fn coin -> coin |> Map.fetch!(field) end)
  end
end

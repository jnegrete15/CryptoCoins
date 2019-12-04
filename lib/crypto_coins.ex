defmodule CryptoCoins do

  require CryptoCoins.Api

  def coin(coins, name) when is_binary(name) do
    #Esta función compara el nombre de la moneda que le pasamos. Nos regresa la moneda cuando el nombre
    #coincide con el nombre de la moneda que le pasamos
    Enum.find(coins, fn coin -> Map.fetch!(coin, "name") == name end)
  end

  def most_valuable(coins) do
    #Aquí usamos la función max_by y de parámetro le decimos que sea por el precio.
    Enum.max_by(coins, fn coin -> Float.parse(Map.fetch!(coin, "price")) end)
  end

  def most_capped(coins) do
    #Esta función es igual que la anterior pero en este caso en lugar de pasarle el price le ponemos
    #marketCap,
    Enum.max_by(coins, fn coin -> Float.parse(Map.fetch!(coin, "marketCap")) end)
  end

  def most_ranked(coins) do
  #Aqui como la moneda más rankeada (la número 1), entonces usamos la funcion Enum.min. Para que
  #nos jale el mínimo.
    Enum.min_by(coins, fn coin -> Float.parse(Map.fetch!(coin, "rank")) end)
  end

    #Usamos la función sort by, le pasamos el array, y el parámatero por el que lo queremos ordenar


  def sort_by(coins, field) do
    Enum.sort_by(coins, fn coin -> Map.fetch!(coin , field) end)
  end
end

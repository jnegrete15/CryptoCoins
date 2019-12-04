defmodule CryptoCoins.Api do
  # Check Tesla Docs
  # API Base is: "https://api.coinranking.com/v1/public"
  # Endpoint is: /coins


  # returns {:ok, array_of_coins}
    use Tesla

    plug Tesla.Middleware.BaseUrl, "https://api.coinranking.com/v1/public"
    plug Tesla.Middleware.Headers, [{"", ""}]
    plug Tesla.Middleware.JSON


  def coins() do
    {:ok, response} = get("/coins")
    if(response.status in 200..299) do
      coins = response |> Map.fetch!(:body) |> Map.fetch!("data") |> Map.fetch!("coins")
    end
#    if ok == :ok do
#      if status in 200..299 do

#        {:ok, coins}
#      else
#        {:error, env}
#      end
#    else
#      {:error, response}
#    end
  end

  # returns array_of_coins
  #raise if error
  def coins!() do
    {:ok, response} = get("/coins")
    raise "Algo salió mal"
  end

end

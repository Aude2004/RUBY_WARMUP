def day_trader(prices)
  return [] unless prices.is_a?(Array)
  return [] if prices.length < 2

  best_profit = 0
  best_days = []

  prices.each_with_index do |buy_price, buy_day|
    prices.each_with_index do |sell_price, sell_day|
      if sell_day > buy_day
        profit = sell_price - buy_price

        if profit > best_profit
          best_profit = profit
          best_days = [buy_day, sell_day]
        end
      end
    end
  end

  best_days
end

# frozen_string_literal: true

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(prices)
  min_price_day = 0
  max_profit = 0
  best_days = Array.new(2, 0)

  prices.each_with_index do |price, today|
    profit_today = price - prices[min_price_day]

    if profit_today > max_profit
      max_profit = profit_today
      best_days = [min_price_day, today]
    end

    if price < prices[min_price_day]
      min_price_day = today
    end
  end

  best_days
end

p stock_picker(prices)

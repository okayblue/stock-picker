def stock_picker(prices)
  best_profits = []
  best_days = []

  # calculating the best possible profit for each day
  prices.each_with_index do |price, index|
    buy = 0
    sell = 0
    profit = 0
    # starting from the current index since we must buy before selling
    for i in index..prices.length - 1
      if prices[i] - price > profit    
        profit = prices[i] - price
        buy = index # prices.find_index(price)
        sell = prices.find_index(prices[i])
      end  
    end
    # recording the best profit and best days for each price in arrays
    best_profits.push(profit)
    best_days.push([buy, sell])
  end
  # the highest profit and corresponding days have the same index
  highest_profit = best_profits.find_index(best_profits.max)
  best_days[highest_profit]
end

# test
p stock_picker([17,3,6,9,15,8,6,1,10])
# should be [1,4] (for a profit of $15 - $3 == $12)
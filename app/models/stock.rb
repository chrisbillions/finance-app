class Stock < ApplicationRecord

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end


  def self.new_from_lookup(ticker_symbol)
    begin
        looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
        price = strip_commas(looked_up_stock.l)
        new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.price)
    rescue Exception => e
        return nil
    end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end

  #def self.new_from_lookup(symbol)
  #  looked_up_stock = StockQuote::Stock.quote(symbol)
  #  return nil unless looked_up_stock.name


  #  new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
  #  new_stock.l
  #end

  #def price
  #  closing_price = StockQuote::Stock.quote(symbol).l
  #  return "#{closing_price} (Closing)" if closing_price

  #  opening_price = StockQuote::Stock.quote(symbol).op
  #  return "#{opening_price} (Opening)" if opening_price

  #  'Unavailable'
  #end
end

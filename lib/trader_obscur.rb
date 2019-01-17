require 'rubygems'
require 'nokogiri'
require 'open-uri'

#prendre les url du site coin markeup et les ranger dans une hash 
def trader
  
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  all_symbol = page.xpath('//td[@class="text-left col-symbol"]')
  all_price = page.xpath('//a[@class="price"]')
  #initialisation du symbol_text et price_text
  symbol_text = []
  price_text = []
  a = {}  
  #extraction du .text dans le all symbol
    all_symbol.each do |symbol|
 	  symbol_text << symbol.text
    end
   #extraction du .text dans all_price  
      all_price.each do |price|
        price_text << price.text 	
      end
      #mettre dans un hash tout le symbol et prix
 return a = Hash[symbol_text.zip(price_text)]


end
 
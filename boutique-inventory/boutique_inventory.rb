class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    items.map { _1[:name] }.sort
  end

  def cheap
    items.select { _1[:price] < 30.0 }
  end

  def out_of_stock
    items.select { _1[:quantity_by_size].empty? } 
  end

  def stock_for_item(name)
    items.select {_1[:name] == name }.first[:quantity_by_size]
  end

  def total_stock
    items.map { _1[:quantity_by_size] }.map(&:values).flatten.sum
  end

  private
  attr_reader :items
end

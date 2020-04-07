class TaxHandler
  NOT_TAXABLE = /book|chocolate|apple|banana|pill|syringe|gloves/

  def initialize(items)
    @items = items
  end

  def classify
    @items.each do |item|
      item.tax = 0.10 unless NOT_TAXABLE =~ item.description
      item.tax = (item.tax + 0.05).truncate(2) if item.imported
      item.price_plus_taxes = ceil_to(item.price + (item.price * item.tax), 1/0.005).ceil(2)
      item.taxes = (item.price_plus_taxes - item.price).ceil(2)
    end
  end

  def calculate
    @items.map(&:taxes).sum
  end

  def totalize
    @items.map {|item| item.quantity * item.price_plus_taxes}.sum
  end

  def ceil_to(number, precision)
    (number * precision).ceil / precision
  end
end
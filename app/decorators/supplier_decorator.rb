class SupplierDecorator
  attr_reader :supplier

  def initialize(supplier)
    @supplier = supplier
  end

  def rank_as_text
    "Rank #{supplier.rank + 1}/#{supplier.category.supplier_count_for_region(supplier.region)}"
  end

  def method_missing(method_name, *args, &block)
    supplier.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    supplier.respond_to?(method_name, include_private) || super
  end

end
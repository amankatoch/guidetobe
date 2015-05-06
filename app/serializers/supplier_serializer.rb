class SupplierSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name, :name_with_region, :name_with_region_and_category, :owned

  def name_with_region
    "#{object.name } (#{object.region.name})"
  end

  def name_with_region_and_category
    "#{object.name} (#{object.category.name} in #{object.region.name})"
  end

  def owned
    object.owned? ? true : false
  end
end

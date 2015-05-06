# Remove all regions first then populate new records
Region.truncate!

# Create the first 11 region
Region.create([
  { name: 'London & South East', description: 'Test'},
  { name: 'North West', description: 'Test'},
  { name: 'Scotland', description: 'Test'},
  { name: 'West Midlands', description: 'Test'},
  { name: 'Wales', description: 'Test'},
  { name: 'Yorkshire', description: 'Test'},
  { name: 'North East', description: 'Test'},
  { name: 'East Midlands', description: 'Test'},
  { name: 'South West', description: 'Test'},
  { name: 'East of England', description: 'Test'},
  { name: 'Northern Ireland', description: 'Test'}

])
puts "Regions loaded successfully"

# Remove all regions first then populate new records
Category.truncate!

# create the categories
Category.create([
  { name: 'Dresses' },
  { name: 'Photographers' },
  { name: 'Cakes' },
  { name: 'Venues' },
  { name: 'Florists' },
  { name: 'Stationery' },
  { name: 'Catering' },  
  { name: 'Entertainment' },
  { name: 'Hair and Make-up' },
  { name: 'Cars' },
  { name: 'Accessories' },

])
puts "Categories loaded successfully"


# Remove all productrs first then populate new records
Product.truncate!

# create the base three products
Product.create([
  { name: 'Premium', description: 'Description', year_price: 0, package: 1 },
  { name: 'Silver', description: 'Description', year_price: 99, package: 2 },
  { name: 'Golden', description: 'Description', year_price: 149, package: 3 }
])
puts "products loaded successfully"

# Remove admin
Admin.truncate!

# create a sample admin
# note: not for production
Admin.create(email: 'thomas@robolizard.com', username: 'TJ', password: 'kane', password_confirmation: 'kane')
# db/seeds.rb

puts "=== SEED: Usuwanie starych danych z bazy... ==="
Order.destroy_all
Part.destroy_all
Manufacturer.destroy_all
Customer.destroy_all
Category.destroy_all

puts "=== SEED: Tworzenie kategorii... ==="
cat1 = Category.create!(name: "Silnik", description: "Części związane z układem napędowym")
cat2 = Category.create!(name: "Hamulce", description: "Elementy układu hamulcowego")
cat3 = Category.create!(name: "Elektronika", description: "Części i moduły elektroniczne")

puts "=== SEED: Tworzenie części (Parts)... ==="
part1 = Part.create!(
  title: "Filtr oleju",
  sku: "FIL-001",
  description: "Filtr oleju do silnika benzynowego",
  status: "available",
  category: cat1
)

part2 = Part.create!(
  title: "Klocki hamulcowe przód",
  sku: "KLO-100",
  description: "Zestaw klocków hamulcowych na przednią oś",
  status: "available",
  category: cat2
)

part3 = Part.create!(
  title: "Sonda lambda",
  sku: "SON-200",
  description: "Sensor spalin montowany w układzie wydechowym",
  status: "unavailable",
  category: cat3
)

puts "=== SEED: Tworzenie producentów (Manufacturers)... ==="
manu1 = Manufacturer.create!(name: "Bosch", description: "Producent systemów wtryskowych, świec i akumulatorów")
manu2 = Manufacturer.create!(name: "Valeo", description: "Producent systemów oświetleniowych i chłodzenia")



puts "=== SEED: Tworzenie klientów (Customers)... ==="
cust1 = Customer.create!(
  name: "Jan Kowalski",
  email: "jan.kowalski@example.com",
  role: "regular",
  phone_number: "123456789",
  address: "Warszawa, ul. Długa 5"
)
cust2 = Customer.create!(
  name: "Anna Nowak",
  email: "anna.nowak@example.com",
  role: "premium",
  phone_number: "987654321",
  address: "Kraków, ul. Krótka 10"
)

puts "=== SEED: Tworzenie zamówień (Orders)... ==="
order1 = Order.create!(
  customer: cust1,
  status: "pending",
  ordered_at: Time.now,
  shipped_at: nil
)
order2 = Order.create!(
  customer: cust2,
  status: "shipped",
  ordered_at: Time.now - 2.days,
  shipped_at: Time.now - 1.day
)


order1.parts << part1
order2.parts << [part1, part2]

puts "=== SEED: Gotowe. Dodano przykładowe dane do bazy ==="

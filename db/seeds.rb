# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

  puts "Cleaning DataBase...."

  Shipment.destroy_all
  CartItem.destroy_all
  Payment.destroy_all
  OrderItem.destroy_all
  Order.destroy_all
  Address.destroy_all
  CartItem.destroy_all
  Cart.destroy_all
  Product.destroy_all
  Category.destroy_all
  User.destroy_all

  puts "Creating Data...."
  puts "Creating Users"
  User.create!(
  [
    { email: "vender@gmail.com",
    password: "12345678" },
    {
      email: "buyer@gmail.com",
      password: "123456"
    }
  ]
  )

  puts "Creating Categories"

  Category.create!(
    [
      {
        name: "Tech"
      },
      {
        name: "Home"
      },
      {
        name: "Clothes"
      }
    ]
  )

  puts "Creating Products...."

  Product.create!(
    [
      {
        title: "MacBook",
        price: 1000,
        published: true,
        category: Category.first,
        user: User.first
      },
            {
        title: "Bed",
        price: 999.99,
        published: true,
        category_id: Category.second.id,
        user_id: User.first.id,
      },
            {
        title: "T-Shirt",
        price: 20,
        published: true,
        category_id: Category.third.id,
        user_id: User.first.id,
      }
    ]
  )

  puts "Creating Address...."

  Address.create!(
    [
      {
        street: "532 RockCreek",
        city: "DeSoto",
        zip_code: "75115",
        country: "EEUU",
        type: "Home",
        user_id: User.second.id
      },

      {
        street: "2479 Deer Run",
        city: "Lewisville",
        zip_code: "75067",
        country: "EEUU",
        type: "Work",
        user_id: User.second.id
      }
    ]
  )

  puts "Creating Cart...."

  Cart.create!(

    user_id: User.second.id
  )

  puts "Creating Items in the cart...."

  CartItem.create!(
    [
      {
        cart_id: Cart.first.id,
        product_id: Product.first.id,
        quantity: 1,
        price: Product.first.price
      },
            {
        cart_id: Cart.first.id,
        product_id: Product.second.id,
        quantity: 1,
        price: Product.second.price
      },
      {
        cart_id: Cart.first.id,
        product_id: Product.third.id,
        quantity: 1,
        price: Product.third.price
      }
    ]
  )

  puts "Creating Order..."

  Order.create!(
    user_id: User.second,
    address_id: Address.all.sample,
    total: CartItem.map { |item| item.price * item.quantity }.sum
  )

  puts "Creating Items in the Order...."

  OrderItem.create!(
    [
    {
      order_id: Order.first.id,
      product_id: CartItem.first.id,
      price_at_purchase: CartItem.first.price,
      quantity: CartItem.first.quantity
    },
    {
      order_id: Order.first.id,
      product_id: CartItem.second.id,
      price_at_purchase: CartItem.second.price,
      quantity: CartItem.second.quantity
    },
    {
      order_id: Order.first.id,
      product_id: CartItem.third.id,
      price_at_purchase: CartItem.third.price,
      quantity: CartItem.third.quantity
    },
    ]
  )

  puts "Creating Shipment...."

  Shipment.create!(
    
  )

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product = Product.new(name: "pencil", price: 1, image_url: "https://t3.ftcdn.net/jpg/02/96/45/94/360_F_296459409_jb3yLASZoalAMCUsRqS9a3i2saUIdBpD.jpg", description: "A really great pencil")
product.save!

product = Product.new(name: "pen", price: 2, image_url: "https://d1o785do8fyxgx.cloudfront.net/stock_item/stock_item_images/images/000/000/592/original/EMP_PEN_ROLLERBALL_WAVE_LIGHT_PINK_1_ECOMM_RESIZED.png?1661262182", description: "A nice pink pen")
product.save!

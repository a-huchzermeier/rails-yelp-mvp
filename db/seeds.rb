# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:

  ["Sushi-ya", "Yabase", "Nikko", "Heyo", "Rialto"].each do |restaurant_name|
    Restaurant.find_or_create_by!(name: restaurant_name, address: "Villa 3", phone_number: "+49 150",  category: "chinese")
  end

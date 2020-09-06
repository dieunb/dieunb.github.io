namespace :db do
  desc "TODO"
  task fake_data: :environment do
    arr_category_names = %w(Samsung Macbook Asus Acer iPhone iPad Dell LG HP Lenovo)

    arr_category_names.each do |category_name|
      category = Category.create(name: category_name)

      ['P1', 'P2'].each do |product_name|
        Product.create(name: product_name, price: 10000, quantity: 3, category: category)
      end
    end
  end

end

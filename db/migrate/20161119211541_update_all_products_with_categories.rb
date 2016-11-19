class UpdateAllProductsWithCategories < ActiveRecord::Migration
  def change
    ['Кухні', 'Шафи-купе', 'Гардероби'].each_with_index do |name, index|
      unless Category.where(name: name).any?
        Category.create(name: name, order: index + 1)
      end
    end

    Product.all.each{ |p| p.update(category_id: Category.all.first.id)}
  end
end

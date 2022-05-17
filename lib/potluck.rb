class Potluck

  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes.push(dish)
  end

  def get_all_from_category(cat)
    @dishes.select {|dish| dish.category == cat}
  end

  def menu
    menu = Hash.new {|hash, key| hash[key] = []}
    @dishes.each do |dish|
      key = dish.category.to_s + 's'
      menu[key.to_sym] << dish.name
      menu[key.to_sym].sort!
    end
    menu
  end

  def ratio(cat)
    category_total = get_all_from_category(cat).length
    (category_total.to_f / @dishes.length) * 100
  end
end

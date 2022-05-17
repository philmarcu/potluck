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


end

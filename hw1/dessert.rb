class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    if calories < 200
      return true
    else
      return false
    end
  end

  def delicious?
    return true
  end

  # setter and getter
  def name
    return @name
  end

  def name=(name)
    @name = name
  end

  def calories
    return @calories
  end

  def calories=(calories)
    @calories = calories
  end

end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end

  def delicious?
    if flavor == "black licorice"
      return false
    end
    return true
  end

  # getter and setter for flavor
  def flavor
    return @flavor
  end

  def flavor=(flavor)
    @flavor = flavor
  end
end

=begin
jellyBean = JellyBean.new("jelly", 190, "blue licorice")
p jellyBean.name
p jellyBean.calories
p jellyBean.flavor
p jellyBean.delicious?
p jellyBean.healthy?
=end

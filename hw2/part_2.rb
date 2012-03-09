class CartesianProduct
  include Enumerable
  def initialize(aryL,aryR)
    @cart = []
    if aryL.length != 0 and aryR.length !=0
      aryL.each do |eltL|
        aryR.each do |eltR|
          @cart.push([eltL, eltR])
        end
      end
    end
  end

  def each
    @cart.each{|e| yield(e)}
  end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

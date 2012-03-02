class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name + "_history"
    class_eval %Q{
      def #{attr_name}=(value)
        @#{attr_name} = value
        if @#{attr_name + "_history"} == nil
          @#{attr_name + "_history"} = []
          @#{attr_name + "_history"}.push(nil)
          @#{attr_name + "_history"}.push(value)
        else
          @#{attr_name + "_history"}.push(value)
        end

      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

=begin
f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f.bar = 4
p f.bar_history
=end

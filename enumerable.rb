module Enumerable
    def my_each
        i = 0
        while i < self.size
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.size
            yield(self[i], i)
            i += 1
        end        
    end

    def my_select
        i = 0
        array2 = []
        while i < self.size
            if yield(self[i])
                array2 << self[i]
            end
            i += 1
        end
        array2
    end
    
    def my_all?

    end
    def my_any?

    end
    def my_none?

    end
    def my_count

    end
    def my_map

    end
    def my_inject

    end
end

[1, 2, 3, 5].my_each { |x| p x }
puts
[1, 2, 3, 5].each { |x| p x } #compare
puts
[1, 2, 3, 5].my_each_with_index { |x, y| puts "#{x} at #{y}" }
puts
[1, 2, 3, 5].each_with_index { |x, y| puts "#{x} at #{y}" }#compare
puts
p [1, 2, 3, 4].my_select { |x| x % 2 == 0}
puts
p [1, 2, 3, 4].select { |x| x % 2 == 0 }#compare
puts
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
[1, 2, 3, 5].my_each_with_index { |x, y| puts "#{x} at #{y}" }
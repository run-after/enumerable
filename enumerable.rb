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
        i = 0
        while i < self.size
            unless yield(self[i])
                return false
            end
            i += 1
        end
        true
    end

    def my_any?
        i = 0
        while i < self.size
            if yield(self[i])
                return true
            end
            i += 1
        end
        false
    end

    def my_none?
        i = 0
        while i < self.size
            if yield(self[i])
                return false
            end
            i += 1
        end
        true
    end

    def my_count(num='')
        if block_given? == false && num == ''
            self.size
        elsif block_given? == false 
            i = 0
            count = 0
            while i < self.size
                if self[i] == num
                    count += 1    
                end
                i += 1
            end
            count
        else
                i = 0
                count = 0
            while i < self.size
                if yield(self[i])
                    count += 1
                end
                i += 1
            end
            count
        end
    end

    def my_map(&proc)
        i = 0
        array2 = []
        while i < self.size
            if block_given?
                array2 << yield(self[i])
            else
                array2 << proc.call(self[i])
            end
            i += 1
        end
        array2
    end

    def my_inject(start = 0)
       i = 0
       accumulator = start
       while i < self.size
            accumulator = yield(accumulator, self[i])
            i += 1
       end
       accumulator
    end



end

def multiply_els(array)
    array.my_inject(1) { |x, y| x * y }
end
=begin
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
p ['alpha', 'apple', 'allen key'].my_all?{ |x| x[0] == 'a' }
puts
p ['alpha', 'apple', 'allen key'].all?{ |x| x[0] == 'a' }
puts
p ['lpha', 'apple', 'llen key'].my_any?{ |x| x[0] == 'a' }
puts
p ['lpha', 'pple', 'allen key'].any?{ |x| x[0] == 'a' }
puts
p ['lpha', 'pple', 'llen key'].my_none?{ |x| x[0] == 'a' }
puts
p ['lpha', 'pple', 'llen key'].none?{ |x| x[0] == 'a' }
puts
p [1,2,3,4,4,7,7,7,9].my_count { |i| i > 1 }
puts
p [1,2,3,4,4,7,7,7,9].count { |i| i > 1 }
puts
p [1,2,3,4,4,7,7,7,9].my_map { |i| i*4 }
puts
p [1,2,3,4,4,7,7,7,9].map { |i| i*4 }
puts 
p [1,2,3,4,4,7,7,7,9].my_inject(0){|running_total, item| running_total + item }
puts
p [1,2,3,4,4,7,7,7,9].inject(0){|running_total, item| running_total + item }
puts 
p multiply_els([2,4,5])
=end
my_proc = Proc.new { |i| i*4 }
p [1,2,3,4,4,7,7,7,9].my_map { |i| i*4 }
puts
p [1,2,3,4,4,7,7,7,9].my_map(&my_proc)
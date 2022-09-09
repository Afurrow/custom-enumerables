module Enumerable
  def my_each_with_index
    return self.to_enum unless block_given?
    self.size.times { |index| yield self[index], index }
    self
  end 

  def my_select
    values_met = []
    self.size.times { |i| values_met.append(self[i]) if yield self[i] }
    values_met 
  end 

  def my_all?
    for val in self do 
      return false unless yield val
    end 
    return true
  end 

  def my_any?
    for val in self do
      return true if yield val 
    end 
    return false
  end 

  def my_none? 
    for val in self do 
      return false if yield val 
    end 
    return true
  end 

  def my_count
    return self.size unless block_given?
    filt_vals = []
    self.size.times { |i| filt_vals.append(self[i]) if yield self[i] }
    filt_vals.length
  end 

  def my_map
    self.size.times { |i| self[i] = yield self[i] }
    self
  end 

  def my_inject(init_val=0)
    rslt = init_val
    self.size.times { |i| rslt = yield rslt, self[i] }
    rslt
  end 
end


class Array
  def my_each    
    return self.to_enum unless block_given?
    for val in self do 
      yield val
    end 
    self
  end 
end

require 'pry'
class Triangle
  attr_accessor :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    illegal
    if a == b && b == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else a != b && b != c && a != c
      :scalene
    end 
  end

  # def illegal
  #   triangle = [(l1 + l2 > l3), (l1 + l3 > l2), (l2 + l3 > l1)]
  #   [l1, l2, l3].each do |side|
  #     if side <= 0
  #       false
  #     raise Triangle::TriangleError if Triangle.include?(false)
  #     end
  #   end
  # end
  def illegal
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
      [a, b, c].each do |side|
        binding.pry
        real_triangle << false if side <= 0
        raise Triangle::TriangleError if real_triangle.include?(false)
      end
    end

  class TriangleError < StandardError
  end
  
end

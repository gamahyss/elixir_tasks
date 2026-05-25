# Реализовать функцию point_inside_circle?(point, circle), которая принимает точку и окружность, и возвращает true, если точка находится внутри окружности, или false, если точка находится снаружи.

# Реализовать функцию point_inside_rect?(point, rect), которая принимает точку и прямоугольник, и возвращает true, если точка находится внутри прямоугольника, или false, если точка находится снаружи.

# Точка представлена кортежем {:point, x, y}.

# Окружность представлена кортежем {:circle, center, radius}, где center — это кортеж :point.

# Прямоугольник представлен кортежем {:rect, left_top, right_bottom}, где left_top и right_bottom — это кортежи :point.

# Уже реализованная функция distance может вам пригодиться:

# point = {:point, 50, 50}
# Solution.point_inside_circle?(point, {:circle, {:point, 10, 10}, 100})
# => true
# Solution.point_inside_circle?(point, {:circle, {:point, -10, -10}, 20})
# => false

# point = {:point, -10, 20}
# Solution.point_inside_rect?(point, {:rect, {:point, -20, 30}, {:point, 20, 10}})
# => true
# Solution.point_inside_rect?(point, {:rect, {:point, 0, 0}, {:point, 10, 10}})
# => false

defmodule AtomsAndTuples do
  def distance({:point, x1, y1}, {:point, x2, y2}) do
    x_dist = abs(x1 - x2)
    y_dist = abs(y1 - y2)
    :math.sqrt(:math.pow(x_dist, 2) + :math.pow(y_dist, 2))
  end

  # BEGIN (write your solution here)
  def point_inside_circle?({:point, x, y}, {:circle, {:point, cx, cy}, radius}) do
    dx = x - cx
    dy = y - cy
    dx * dx + dy * dy <= radius * radius
  end

  def point_inside_rect?({:point, x, y}, {:rect, {:point, left, top}, {:point, right, bottom}}) do
    x >= left and x <= right and y >= bottom and y <= top
  end
  # END
end

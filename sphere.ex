defmodule Sphere do

  defstruct(pos: {0,0,0}, radius: 2, color: @color)


    defimpl Object do

    def intersect(sphere, ray) do
      Sphere.intersect(sphere, ray)
    end

    def normal(sphere, _, pos) do
      # assuming we always hit it from the outside
      Vector.normalize(Vector.sub(pos, sphere.pos))
    end
  end



    def intersect(sphere, ray) do
      k = Vector.sub(sphere.pos, ray.pos)
      a = Vector.dot(ray.dir, k)
      a2 = :math.pow(a,2)
      k2 = :math.pow(Vector.norm(k), 2)
      r2 = :math.pow(spere.radius, 2)
      t2 = a2 - k2 + r2
      closest(t2, a)
    end

    defp closest(t2, a) do
   if t2 < 0 do
     :no
   else
     t = :math.sqrt(t2)
     d1 = a - t
     d2 = a + t

     cond do
       d1 > 0.0 and d2 > 0.0 ->
         {:ok, min(d1, d2)}
       d1 > 0.0 ->
         {:ok, d1}
       d2 > 0.0 ->
         {:ok, d2}
       true ->
         :no
     end
   end


end

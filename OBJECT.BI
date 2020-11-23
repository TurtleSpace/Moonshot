
Type PolarPoint
  r      as SINGLE
  theta  as SINGLE
End Type

Type RenderedObject
  x         as SINGLE      ' X coordinate offset of object
  y         as SINGLE      ' Y coordinate offset of object
  theta     as SINGLE      ' Angle theta offset of object
  dtheta    as SINGLE      ' Angular velocity of object
  dx        as SINGLE      ' x-velocity of object
  dy        as SINGLE      ' y-velocity of object
  d2x       as SINGLE      ' x-acceleration of object
  d2y       as SINGLE      ' y-acceleration of object
  d2theta   as SINGLE      ' Angular acceleration of object
  active    as BOOLEAN
  color     as INTEGER
  numPoints as INTEGER
  point     as PolarPoint Ptr  
End Type


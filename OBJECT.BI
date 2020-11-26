
Type PolarPoint
  r      as SINGLE
  theta  as SINGLE
End Type

Type RenderedObject
  x         as Single      ' X coordinate offset of object
  y         as Single      ' Y coordinate offset of object
  theta     as Single      ' Angle theta offset of object
  dtheta    as Single      ' Angular velocity of object
  dx        as Single      ' x-velocity of object
  dy        as Single      ' y-velocity of object
  d2x       as Single      ' x-acceleration of object
  d2y       as Single      ' y-acceleration of object
  d2theta   as Single      ' Angular acceleration of object
  active    as Boolean
  color     as Integer = 7 ' Default is white low intensity
  axisCount as Integer
  axis      as PolarPoint Ptr
  scale     as Single = 1  ' Scale of radius for each axis
End Type


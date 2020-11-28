#include once "OBJECT.BI"
#include once "SCENE.BI"

#define BSP_SPLIT_H     0             ' Split horrizontally
#define BSP_SPLIT_V    -1             ' Split vertically
#define BSP_MAXOBJ      2
#define BSP_MAXDEPTH    5

Type BSPNode
  splitDir     as Integer                ' 0 = Horrizontal, -1 = Vertical
  objCount     as Integer                ' # of objects in node
  a            as BSPNode Ptr            ' Left/Top side of tree
  b            as BSPNode Ptr            ' Right/Bottom side of tree
  width        as Integer                ' Width in pixels
  height       as Integer                ' Height in pixels
  xo           as Integer                ' Left boundry x offset
  yo           as Integer                ' Top boundry y offset
  obj          as RenderedObject Ptr Ptr ' Objects in the node
  depth        as Integer                ' Current depth of node in tree
End Type

type BSPCollisionModel extends SceneCollisionModel
  maxObj      as Integer
  maxDepth    as Integer
end type

Declare Sub BSPCollisionModelInit(model as BSPCollisionModel Ptr)

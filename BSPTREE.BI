#define BSP_MAXOBJ      4             ' Max objects per node.
#define BSP_MAXDEPTH    4             ' Maximum BSP tree depth (-1). <= 35.
#define BSP_SPLIT_H    -1             ' Split horrizontally
#define BSP_SPLIT_V     1             ' Split vertically

#include "OBJECT.BI"
#include "SCENE.BI"


Type BSPNode
  splitDir as Integer                ' 0 = Horrizontal, -1 = Vertical
  objCount as Integer     = 0        ' # of objects in node
  a        as BSPNode Ptr = 0        ' Left/Top side of tree
  b        as BSPNode Ptr = 0        ' Right/Bottom side of tree
  width    as Integer                ' Width in pixels
  height   as Integer                ' Height in pixels
  xo       as Integer                ' Left boundry x offset
  yo       as Integer                ' Top boundry y offset
  obj      as RenderedObject Ptr Ptr ' Objects in the node
  depth    as Integer                ' Current depth of node in tree
End Type

Declare Function createBSPNode(sc as Scene Ptr) as BSPNode Ptr
Declare Sub destroyBSPNode(node as BSPNode Ptr)
Declare Sub splitBSPNode(sc as Scene Ptr, node as BSPNode Ptr)
Declare Sub addToBSPNode(sc as Scene Ptr, node as BSPNode Ptr, _
 ob as RenderedObject Ptr)

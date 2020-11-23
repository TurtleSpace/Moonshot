#define BSP_MAXOBJ 4                   ' Max objects per node.
#define BSP_MAXDEPTH 4                 ' Maximum BSP tree depth. <= 35.

#include "OBJECT.BI"

Type BSPTree
    sectDir      as Integer            ' Split direction. -1: horizontal, 0: vertical
    parentTree   as BSPTree Ptr        ' Parent tree node
    numObjects   as Integer            ' Current # of objects in node
    obj          as RenderedObject Ptr ' Obects in the current node
    node         as BSPTree Ptr        ' Child nodes
End Type







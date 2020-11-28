#include once "BSPTREE.BI"

Sub collisionCheck(sc as Scene Ptr)
  ' TODO
End Sub

Sub BSPCollisionModelInit(model as BSPCollisionModel Ptr)
  With *model
    .checkCollisions = @collisionCheck
    .maxDepth        = BSP_MAXDEPTH
    .maxObj          = BSP_MAXOBJ
  End With
End Sub

Sub _addBSPObject(obj as RenderedObject Ptr)
  ' TODO
End Sub

Sub _splitBSPNode(node as BSPNode Ptr)
  ' TODO
End Sub

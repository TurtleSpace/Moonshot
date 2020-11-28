#include "BSPTREE.BI"

Function createBSPNode(sc as Scene Ptr) as BSPNode Ptr
  Dim as BSPNode Ptr bsp = Allocate(SizeOf(BSPNode))
  ' TODO: Change 10 to maxobj?
  bsp->obj = CAllocate(sc->objCount * SizeOf(RenderedObject Ptr))

  Return bsp
End Function

' Recursively deallocates nodes and all of their data.
Sub destroyBSPNode(bsp as BSPNode Ptr)
  With *bsp
    If Not .a = 0 Then destroyBSPNode(.a)
    If Not .b = 0 Then destroyBSPNode(.b)

    Deallocate(.obj) ' Objects first
    Deallocate(bsp)      ' Then the node itself
  End With
End Sub

' Adds an object to a BSP node:
Sub addToBSPNode(sc as Scene Ptr, bsp as BSPNode Ptr, ob as RenderedObject Ptr)
  If bsp->objCount = BSP_MAXOBJ _
   and Not bsp->depth = BSP_MAXDEPTH Then splitBSPNode(sc, bsp)

   ' TODO: Push objects down or keep them in current
End Sub

Sub splitBSPNode(sc as Scene Ptr, bsp as BSPNode Ptr)
  Dim splitDir as Integer = Not .splitDir
  Dim bsp_a as BSPNode = *(createBSPNode(sc))
  Dim bsp_b as BSPNode = *(createBSPNode(sc))

  with *bsp
    bsp_a.obj = CAllocate(sc->objMax * SizeOf(RenderedObject Ptr))
    bsp_b.obj = CAllocate(sc->objMax * SizeOf(RenderedObject Ptr))
    .a = @bsp_a
    .b = @bsp_b

    ' bsp_a offset always = the parent node offsets.
    bsp_a.xo = .xo
    bsp_a.yo = .yo

    If bsp->splitDir = BSP_SPLIT_H Then
       Dim splitWidth as Integer     = .width / 2
       
       bsp_a.width                  = splitWidth
       bsp_a.height                 = .height
       bsp_b.xo                     = .xo + splitWidth + 1
       bsp_b.yo                     = .yo
       bsp_b.width                  = splitWidth
       bsp_b.height                 = .height

       
     ElseIf .splitDir = BSP_SPLIT_V Then
     
       Dim splitHeight as Integer    = .height / 2
       bsp_a.width                  = .width
       bsp_a.height                 = splitHeight
       bsp_b.xo                     = .xo
       bsp_b.yo                     = .yo + splitHeight + 1
       bsp_b.height                 = splitHeight
       bsp_b.width                  = .width
     End If
   End With
  
End Sub

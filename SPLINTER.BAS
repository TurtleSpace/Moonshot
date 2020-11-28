' Codename :: Splinter -  The DOS polar vector object game engine
' Written by the Turtle Space Industries community

#include once "BSPTREE.BI"
#include once "OBJECT.BI"
#include once "SCENE.BI"
#include once "FBGFX.BI"
#include once "SPLINTER.BI"

#if __FB_LANG__ = "fb"
Using FB '' ' Keyboard constants
#endif

Type SingleLink
  nextLink as SingleLink Ptr = 0
End Type

Function sc_addObject(sc as Scene Ptr, ob as RenderedObject Ptr) as Integer
  If sc->objCount = sc->objMax Then Return -1

  sc->obj[sc->objCount] = ob
  sc->objCount += 1
  
  Return 0
End Function

Function sc_removeObject(sc as Scene Ptr, ob as RenderedObject Ptr) as Integer
  If sc->objCount = 0 then Return -1
  Dim i as Integer

  For i = 1 To sc->objCount - 1
    if sc->obj[i] = ob Then
      sc->obj[i] = 0
      sc->objLast = i
    End If
  Next i
  sc->objCount -= 1

  Return 0
End Function

' ------------

'Draws an object to the framebuffer
Sub sc_drawObject(sc as Scene Ptr, ob as RenderedObject Ptr)
  Dim axis as PolarPoint Ptr Ptr
  Dim as Single x1, y1, x2, y2                ' For our line drawing
  Dim termAxis as Integer = ob->axisCount - 1 ' Terminating axis
  
  'Cycle through each axis, determining the x and y coordinates in
  ' rectangular form, then drawing lines in between them:
  For i as Integer = 0 To termAxis
    With ob->axis[i]
      x1 = (.r * ob->scale) * cos(.theta + ob->theta) + ob->x
      y1 = (.r * ob->scale) * sin(.theta + ob->theta) + ob->y
    End With

    ' use the next point:
    With ob->axis[i + 1]
      x2 = (.r * ob->scale) * cos(.theta + ob->theta) + ob->x
      y2 = (.r * ob->scale) * sin(.theta + ob->theta) + ob->y
    End With
    
    Line sc->buffer, (x1, y1)-(x2, y2), ob->color
  Next i
End Sub

Sub vsyncLoop(sc as Scene Ptr, px as Integer, py as Integer, _
 pd as Integer, vx as Integer, vy as Integer, ox as Integer, oy as Integer)
  ' Initialize the buffer:
  ScreenRes px, py, pd
  Setmouse 0, 0, 0, 0 ' Hide the mouse pointer
  sc->buffer = ImageCreate(vx, vy) ' Create a buffer

  Do
    ' TODO: Remove
    If MultiKey(SC_CONTROL) And MultiKey(SC_Q) Then
      sc->active = False
    End If

    Dim as BSPNode Ptr bsp = createBSPNode(sc)

    ' Add each object to the BSP tree:
    For i as Integer = 0 To sc->ObjCount - 1
      addToBSPNode(sc, bsp, sc->obj[i])
    Next i
    
    destroyBSPNode(bsp)
    
    ScreenLock
    ' TODO: BSP / Quadtree screen blanking:
    Line sc->buffer, (0, 0)-(vx, vy), 16, BF
    
    ' Loop through objects, placing them on the screen one by one:
    For i as Integer = 0 To sc->objCount - 1
      sc_drawObject(sc, sc->obj[i])
    Next i


    Put (0, 0), sc->buffer, (ox, oy)-Step(px,py), Trans
    ScreenUnlock

    ScreenSync
  Loop Until sc->active = False

  ImageDestroy(sc->buffer)
  Screen 0
End sub


#include once "SCENE.BI"

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

Sub _sc_collisionStub(sc as Scene Ptr) : End Sub ' Do nothing

Sub sc_init(sc as Scene Ptr)
  Dim as SceneCollisionModel dummy_cl
  dummy_cl.checkCollisions = @_sc_collisionStub
  sc->collisionModel = @dummy_cl
End Sub

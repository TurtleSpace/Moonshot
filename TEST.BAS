#include once "OBJECT.BI"
#include once "SCENE.BI"
#include once "SPLINTER.BI"

Dim sc as Scene
sc.objMax = 5
sc.obj = CAllocate(sc.objMax * SizeOf(RenderedObject))

' Initialize memory:
For i as Integer = 0 to sc.objmax - 1
  sc.obj[i] = 0
Next i

sc.name = "Testing"

Dim ob as RenderedObject
ob.axisCount = 4

ob.axis = CAllocate(4 * SizeOf(PolarPoint))

ob.axis[0].r     = 0
ob.axis[0].theta = 0

ob.axis[1].r     = 7
ob.axis[1].theta = 2.35619

ob.axis[2].r     = 7
ob.axis[2].theta = 0

ob.axis[3].r     = 7
ob.axis[3].theta = 3.92699

ob.x = 100
ob.y = 100
ob.color          = 7
sc_addObject(@sc, @ob)

' Start the scene:

sc.active = True
vsyncLoop(@sc, 320, 240, 8, 352, 240, 32, 32)

Deallocate(ob.axis)


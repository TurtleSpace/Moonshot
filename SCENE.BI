#include once "FBGFX.BI"
#include once "OBJECT.BI"

Type SceneCollisionModelFwd as SceneCollisionModel

Type Scene
  name           as String                        ' Name of scene. Unused internally
  objCount       as Integer                       ' Current # of active objects
  active         as Boolean = False               ' Set to False to break vsync loop
  objMax         as Integer                       ' Maximum # of objects allowed in scene
  objLast        as Integer                       ' Last object to be allocated
  buffer         as FB.Image Ptr                  ' Framebuffer
  obj            as RenderedObject Ptr Ptr        ' Object repository for scene
  collisionModel as SceneCollisionModelFwd Ptr    ' Model used for collision detection
End Type

Type SceneCollisionModel
  checkCollisions as Sub (sc as Scene Ptr)
End Type

Declare Function sc_addObject(sc as Scene Ptr, ob as RenderedObject Ptr) as Integer
Declare Function sc_removeObject(sc as Scene Ptr, ob as RenderedObject Ptr) as Integer
Declare Sub sc_init(sc as Scene Ptr)
Declare Sub sc_destroy(sc as Scene Ptr)

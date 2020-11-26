#include once "OBJECT.BI"
#include once "FBGFX.BI"

Type Scene
  name        as String             ' Name of scene. Unused internally
  objCount    as Integer            ' Current # of active objects
  obj         as RenderedObject Ptr Ptr ' Object pointers are stored here
  active      as Boolean = False ' Set to False to break vsync loop
  objMax      as Integer = 0 ' Maximum # of objects allowed in scene
  objHead     as Integer = 0 ' Pointer to last activated object
  objLast     as Integer = 0 ' Last object to be allocated
  buffer      as FB.Image Ptr ' Framebuffer
End Type

Declare Function sc_addObject(sc as Scene Ptr, ob as RenderedObject Ptr) as Integer
Declare Function sc_removeObject(sc as Scene Ptr, ob as RenderedObject Ptr) as Integer


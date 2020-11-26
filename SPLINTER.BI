Declare Sub vsyncLoop(sc as Scene Ptr, px as Integer, py as Integer, _
 pd as Integer, vx as Integer, vy as Integer, ox as Integer, oy as Integer)

' px, py, and pd are the physical x, y and depth of the screen resolution.
' vx and vy is the resolution of the virtual framebuffer, and ox and oy are
' the offset of the physical video output relative to the top left of the
' virtual framebuffer.


This project will render a Coco Mademoiselle Perfume Bottle with a infinity wall and 3 point lighting

All rib files containing the attributes and geometies are contained within 
the rib folder. The file(s) to be rendered are within renderRib but must be rendered 
from outside this folder, ie. in the main project. All patterns and displacement 
shaders, as well as textures, are in the shaders folder. Finally, the images will be rendered
to the images folder. 

There is one image in the images folder which shows the output of Perfume_turnTable_000.rib.
However, if you render Perfume_turnTable_000.rib this is currently set to display in it.
To get all the render files for the full turn table the CreateRenderRibs_turnTable.py has to be run.

The render of one frame is quite long due to the glass shaders and lighting conditions, 
but it has also not been optimised as this was not the aim of the project. 

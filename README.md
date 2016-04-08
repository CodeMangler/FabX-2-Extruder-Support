# FabX-2-Extruder-Support

[Note: This is still work in progress. The v2 part fits pretty well, but with a bit of dremeling. I've now added a v3 part made with OpenSCAD which should help reach a better fit, but I haven't tried it myself yet.]

FabX 2 machines use a Budaschnozzle v2 (likely, a chinese variant of it), which is mounted a few mm below the extruder assembly. The gap causes flex filaments to, well, flex occasionally and make it hard to print with them.

This thing closes the gap between the extruder assembly and the hotend, providing a near gapless path for the filament to pass through. This support has been designed to be used with an additional PTFE (or similar) tubing to provide a smoother path for the filament.

This is now available on Thingiverse at: http://www.thingiverse.com/thing:1472080

![FabX 2 Extruder Support on Thingiverse](http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=thingiverse.com/thing:1472080&choe=UTF-8&chld=Q|1)

## How I Designed This
I made the initial version by measuring topside of the Budaschnozzle with a pair of calipers and then modelling based on that. It turned out to be fairly inaccurate.

For the second version, I found the Budaschnozzle v2.0 drawings published by Lulzbot (https://devel.lulzbot.com/Budaschnozzle/v2.0/), which helped fixed the dimensions to an extent. I made a drawing in AutoCAD and then extruded it to get the final 3D shape. This turned out pretty well, except it needed a bit of dremelling at the corners to make it fit properly.

I made the third version from scratch in OpenSCAD. I haven't tried printing and using this yet. But this should be more accurate, and potentially be a better fit because I've used numbers from the official Budaschnozzle drawing as parameters to the design. If it doesn't fit well, it should be easy to modify it since it's an OpenSCAD model.

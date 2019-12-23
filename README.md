** Airport **

LANDING
airport.land(my_plane) -> airport.planes = my_plane

TAKE OFF
airport.take_off(plane) -> airport.planes = []

** PLANE **

TAKE OFF
airport.take_off(plane) -> plane.in_air? = true



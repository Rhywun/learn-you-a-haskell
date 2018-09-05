module Chapter07.Geometry
  ( sphereVolume
  , sphereArea
  , cubeVolume
  , cubeArea
  , cuboidVolume
  , cuboidArea
  )
where

import qualified Chapter07.Geometry.Sphere as Sphere
import qualified Chapter07.Geometry.Cuboid as Cuboid
import qualified Chapter07.Geometry.Cube as Cube

sphereVolume :: Float -> Float
sphereVolume = Sphere.volume

sphereArea :: Float -> Float
sphereArea = Sphere.area

cubeVolume :: Float -> Float
cubeVolume = Cube.volume

cubeArea :: Float -> Float
cubeArea = Cube.area

cuboidVolume :: Float -> Float -> Float -> Float
cuboidVolume = Cuboid.volume

cuboidArea :: Float -> Float -> Float -> Float
cuboidArea = Cuboid.area

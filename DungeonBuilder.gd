@tool
extends Node

@export_multiline var layout: String
@export var tile_scene: PackedScene

func _ready():
	build_dungeon()

func build_dungeon():
	var lines: PackedStringArray = layout.split("\n")
	
	var grid = Array()
	for line in lines:
		grid.append(Array(line.split()))

	for y in grid.size():
		for x in grid[y].size():
			if grid[y][x] == "." or grid[y][x] == "S":
				if y > 0 and x > 0 and y < grid.size() - 1 and x < grid[y].size() - 1:
					var north = grid[y-1][x] == "#"
					var east  = grid[y][x+1] == "#"
					var south = grid[y+1][x] == "#"
					var west  = grid[y][x-1] == "#"
					
					var new_tile: DungeonTile = tile_scene.instantiate() as DungeonTile
					new_tile.NorthWall = north
					new_tile.EastWall = east
					new_tile.SouthWall = south
					new_tile.WestWall = west
					
					new_tile.position.x = -y * 2
					new_tile.position.z = x * 2
					
					$Laby.add_child(new_tile)
					
					if grid[y][x] == "S":
						$Laby/Camera3D.position.x = -y * 2
						$Laby/Camera3D.position.z = x * 2
				else:
					printerr("Invalid dungeon layout : Floor on the edge")

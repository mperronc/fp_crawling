class_name DungeonTile
extends Node3D

@export var NorthWall: bool:
	set(val):
		NorthWall = val
		update_walls()
		
@export var EastWall: bool:
	set(val):
		EastWall = val
		update_walls()
		
@export var SouthWall: bool:
	set(val):
		SouthWall = val
		update_walls()
		
@export var WestWall: bool:
	set(val):
		WestWall = val
		update_walls()

# Called when the node enters the scene tree for the first time.
func _ready():
	update_walls()

func update_walls():
	$North.visible = NorthWall
	$North/CSGMesh3D.use_collision = NorthWall
	$East.visible = EastWall
	$East/CSGMesh3D.use_collision = EastWall
	$South.visible = SouthWall
	$South/CSGMesh3D.use_collision = SouthWall
	$West.visible = WestWall
	$West/CSGMesh3D.use_collision = WestWall

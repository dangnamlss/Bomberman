extends Node2D

var middleFlame = load("res://Scenes/Prefabs/ExplosionFlame/MiddleFlame.tscn")
var topFlame = load("res://Scenes/Prefabs/ExplosionFlame/TopFlame.tscn")

var degree : int
var levelDamage : int;

func _ready():
	pass 

func init(var _degree,var _levelDamage):
	setRotation(_degree)
	levelDamage = _levelDamage
	pass
	
func setRotation(var _degree:int):
	degree = _degree;
	$Sprite.rotation_degrees = _degree;
	pass
	
func createFlame(var _position : Vector2):
	if(!$Sprite/CheckWall.get_collider()):
		if(levelDamage > 1):
			if(get_child_count() > 2):
				get_child(2).createFlame(_position);
				pass
			else:	#create and pass value in middle flame
				var newFlame = middleFlame.instance();
				newFlame.init(degree,levelDamage-1);
				newFlame.set_position(_position);
				add_child(newFlame);
				pass
		else:	#create and pass value in top flame
			var newFlame = topFlame.instance();
			newFlame.init(degree,levelDamage-1);
			newFlame.set_position(_position);
			add_child(newFlame);
			pass	
	pass

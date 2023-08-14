/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
#region Control

key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check(vk_space)

#endregion
#region Movimentação
var move = key_right - key_left
hspd = move * spd;
vspd = vspd + grv;



//COLISÃO HORIZONTAL
if place_meeting(x+hspd,y,obj_wall4)
{
while(!place_meeting(x+sign(hspd),y,obj_wall4))
{
	x = x +sign(hspd);
	}
hspd = 0;
	}
x = x + hspd;

//COLISÃO VERTICAL
if place_meeting(x,y+vspd,obj_wall4)
{
while(!place_meeting(x,y+sign(vspd),obj_wall4))
{
	y = y +sign(vspd);
}
vspd = 0;
}
y = y + vspd;
//JUMP
if place_meeting(x,y+1,obj_wall4) and key_jump
{
	vspd -= 12;

}
#endregion
if global.life < 1 {
game_restart();

}
#region sprite
if(hspd !=0) image_xscale = sign(hspd);
if(!place_meeting(x,y+1,obj_wall4)){
sprite_index = spr_player_jumpinicial;
if(sign(vspd)>0.5)sprite_index = spr_player_jumpfall;else sprite_index = spr_player_jumpinicial;


}
else
{
	if(hspd != 0)
	{
		sprite_index = spr_player_runnnig;
	}
}
	if hspd=0{
		if place_meeting(x,y+1,obj_wall4){
		
		sprite_index = spr_player_idle;
		}
	}
	if hspd !=0 {
		if (place_meeting(x,y+1,obj_wall4)){
			sprite_index = spr_player_runnnig;
			
		}
	}
#endregion
if num = 3{
	room_goto_next()
}







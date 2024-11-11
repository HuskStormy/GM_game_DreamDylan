var _obj = global.cam_objetive;
var _r = 0.1;
if (x != _obj.x) x += (_obj.x - x)* _r;
if (y != _obj.y) y += (_obj.y - y)* _r;

cam_main = camera_create_view(0,0,CAM_WIDTH,CAM_HEIGHT,0,self,-1,-1,CAM_WIDTH/2,CAM_HEIGHT/2);
view_camera[0] = cam_main;





if (global.cam_contina) cortinal_val = clamp(cortinal_val+global.cam_contina_val,0,1);
else cortinal_val = clamp(cortinal_val-global.cam_contina_val,0,1);
///singleton()

var t := instance_number(object_index) < 2;
if(!t)
   instance_destroy();
return t;

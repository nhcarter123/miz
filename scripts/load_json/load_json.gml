var file_name = argument0;
var save_string;

var buffer = buffer_load(file_name);
save_string = buffer_read(buffer,buffer_string);
buffer_delete(buffer);

return json_decode(save_string);
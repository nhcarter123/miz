var file_name = argument0;
var save_string = argument1;

var buffer = buffer_create(string_byte_length(save_string)+1,buffer_fixed,1);
buffer_write(buffer,buffer_string,save_string);
buffer_save(buffer,file_name);
buffer_delete(buffer);
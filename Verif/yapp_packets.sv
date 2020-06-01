// Define your enumerated type(s) here
//typedef enum bit {BAD_PARITY,GOOD_PARITY} parity_t;
//
//class yapp_packet extends uvm_sequence_item;
//
//// Define the protocol data
//rand bit [5:0] length;
//rand bit [1:0] addr;
//rand bit [7:0] payload[];
//     bit [7:0] parity;
//
//// Define control knobs
//rand int packet_delay;
//rand parity_t parity_type;
//
//// Enable automation of the packet's fields
//`uvm_object_utils_begin(yapp_packet)
//   `uvm_field_int(length, UVM_ALL_ON)
//   `uvm_field_int(addr, UVM_ALL_ON)
//   `uvm_field_array_int(payload, UVM_ALL_ON)
//   `uvm_field_int(parity, UVM_ALL_ON)
//`uvm_object_utils_end
//
//// Define packet constraints
//constraint payload_size {length == payload.size();}
//constraint default_length {length > 0;}
//constraint pkt_delay {packet_delay > 1;packet_delay <64;}
//
//// Add methods for parity calculation and class construction
//
//function void set_parity();
// if (parity_type == BAD_PARITY)
//   parity = 8'h55;
// else 
//   parity = 8'hAA;
//endfunction
//
//function void post_randomize();
// set_parity();
//endfunction
//
//function new(string name = "yapp_packet");
// super.new(name);
//endfunction
//
////virtual task new_crc_cal(int data1);
////endtask
//
//endclass: yapp_packet

class short_yapp_packet extends yapp_packet;

rand bit [7:0] short_addr;
`uvm_object_utils_begin(short_yapp_packet)
   `uvm_field_int(short_addr, UVM_ALL_ON)
`uvm_object_utils_end

constraint default_length {length > 0;length < 15;}

function new(string name = "short_yapp_packet");
 super.new(name);
endfunction

//virtual task new_crc_cal(int data1, int data2);
//endtask

endclass: short_yapp_packet 

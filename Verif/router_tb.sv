class router_tb extends uvm_component;

 yapp_env yapp;
 hbus_env hbus;
 channel_env chan0;
 channel_env chan1;
 channel_env chan2;

`uvm_component_utils(router_tb)

 function new(string name, uvm_component parent);
  super.new(name,parent);
 endfunction
 
 virtual function void build_phase(uvm_phase phase);
   set_config_int("*","recording_detail",1);
   set_config_int("hbus","num_masters",1);
   set_config_int("hbus","num_slaves",0);
   set_config_int("chan0","has_tx",0);
   set_config_int("chan1","has_tx",0);
   set_config_int("chan2","has_tx",0);
   super.build_phase(phase);
   yapp = yapp_env::type_id::create("yapp",this);
   hbus = hbus_env::type_id::create("hbus",this);
   chan0 = channel_env::type_id::create("chan0",this);
   chan1 = channel_env::type_id::create("chan1",this);
   chan2 = channel_env::type_id::create("chan2",this);
 endfunction

 function void end_of_elaboration_phase(uvm_phase phase);
   uvm_top.print_topology();
 endfunction

endclass


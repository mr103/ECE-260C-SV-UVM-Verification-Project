class base_test extends uvm_test;

 router_tb tb;

`uvm_component_utils(base_test)

  function new(string name, uvm_component parent);
   super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   tb = router_tb::type_id::create("tb",this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
   uvm_top.print_topology();
  endfunction

endclass

class short_yapp_pkt_test extends base_test;

 `uvm_component_utils(short_yapp_pkt_test)

  function new(string name, uvm_component parent);
   super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
   uvm_config_wrapper::set(this,"env.tx_agent.sequencer.run_phase","default_sequence",yapp_5_packets::type_id::get());
   set_type_override_by_type(yapp_packet::get_type(),short_yapp_packet::get_type());
   super.build_phase(phase);
  endfunction

endclass

class set_config_test extends base_test;

 `uvm_component_utils(set_config_test)

  function new(string name, uvm_component parent);
   super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
   set_config_int("env.tx_agent","is_active",UVM_PASSIVE);
   super.build_phase(phase);
  endfunction

endclass

class yapp_012_seq_test extends base_test;

 `uvm_component_utils(yapp_012_seq_test)

  function new(string name, uvm_component parent);
   super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
   uvm_config_wrapper::set(this,"tb.env.tx_agent.sequencer.run_phase","default_sequence",yapp_012_seq::type_id::get());
   super.build_phase(phase);
  endfunction

endclass

class simple_test extends base_test;

 `uvm_component_utils(simple_test)

  function new(string name, uvm_component parent);
   super.new(name,parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
   uvm_config_wrapper::set(this,"tb.yapp.tx_agent.sequencer.run_phase","default_sequence",yapp_012_seq::type_id::get());
   uvm_config_wrapper::set(this,"tb.chan0.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
   uvm_config_wrapper::set(this,"tb.chan1.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
   uvm_config_wrapper::set(this,"tb.chan2.rx_agent.sequencer.run_phase","default_sequence",channel_rx_resp_seq::type_id::get());
   super.build_phase(phase);
  endfunction

endclass


module top;

  // import the UVM library
  import uvm_pkg::*;
`include "uvm_macros.svh"
 //`include "/ccstools/cdsind1/INCISIV111S014/tools/uvm/uvm_lib/uvm_sv/sv/uvm_macros.svh"
 `include "channel.svh"
 `include "yapp.svh"
 `include "hbus.svh"
 `include "router_tb.sv"
 `include "router_test_lib.sv"

`include "yapp_if.sv"
 `include "hbus_if.sv"
 `include "channel_if.sv"

  // clock, reset are generated here for this DUT
  bit reset;
  bit clock; 

  // YAPP Interface to the DUT
  yapp_if in0(clock, reset);
  channel_if chan0 (clock, reset);
  channel_if chan1 (clock, reset);
  channel_if chan2 (clock, reset);
  hbus_if hbus0(clock, reset);

  initial begin
    uvm_config_db#(virtual yapp_if)::set(null,"*.tb.yapp.tx_agent.*","vif",in0); 
    uvm_config_db#(virtual channel_if)::set(null,"*.tb.chan0.rx_agent.*","vif",chan0); 
    uvm_config_db#(virtual channel_if)::set(null,"*.tb.chan0.monitor.*","vif",chan0); 
    uvm_config_db#(virtual channel_if)::set(null,"*.tb.chan1.rx_agent.*","vif",chan1); 
    uvm_config_db#(virtual channel_if)::set(null,"*.tb.chan1.monitor.*","vif",chan1); 
    uvm_config_db#(virtual channel_if)::set(null,"*.tb.chan2.rx_agent.*","vif",chan2); 
    uvm_config_db#(virtual channel_if)::set(null,"*.tb.chan2.monitor.*","vif",chan2); 
    uvm_config_db#(virtual hbus_if)::set(null,"*.tb.hbus.masters[0].*","vif",hbus0); 
    uvm_config_db#(virtual hbus_if)::set(null,"*.tb.hbus.monitor.*","vif",hbus0); 
    run_test("simple_test");
  end

  // ADD YAPP Interface to the DUT

  initial begin
    $timeformat(-9, 0, " ns", 8);
    reset <= 1'b0;
    clock <= 1'b1;
    //in0.in_suspend <= 1'b0;
    @(negedge clock)
      #1 reset <= 1'b1;
    @(negedge clock)
      #1 reset <= 1'b0;
  end

  //Generate Clock
  always
    #10 clock = ~clock;

   yapp_router yapp_router_inst (
    .clock(clock),
    .reset(reset),
    .error(),
    .in_data(in0.in_data),
    .in_data_vld(in0.in_data_vld),
    .in_suspend(in0.in_suspend),
    .data_0(chan0.data),  //Channel 0
    .data_vld_0(chan0.data_vld), 
    .suspend_0(chan0.suspend), 
    .data_1(chan1.data),  //Channel 1
    .data_vld_1(chan1.data_vld), 
    .suspend_1(chan1.suspend), 
    .data_2(chan2.data),  //Channel 2
    .data_vld_2(chan2.data_vld),
    .suspend_2(chan2.suspend),
    // Host Interface Signals
    .haddr(hbus0.haddr),
    .hdata(hbus0.hdata_w),
    .hen(hbus0.hen),
    .hwr_rd(hbus0.hwr_rd)
   );   
  
   initial begin
    $dumpvars(0,top); 
   end

endmodule

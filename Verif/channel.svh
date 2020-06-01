
`ifndef CHANNEL_SVH
`define CHANNEL_SVH

// UVM class library compiled in a package
//import uvm_pkg::*;

// Bring in the rest of the library (macros and template classes)
//`include "uvm_macros.svh"

typedef uvm_config_db#(virtual channel_if) channel_vif_config;

`include "yapp_packet.sv"
`include "channel_resp.sv"

// Common monitor for this ENV
`include "channel_monitor.sv"

//`include "channel_tx_monitor.sv"
`include "channel_tx_sequencer.sv"
`include "channel_tx_driver.sv"
`include "channel_tx_agent.sv"
`include "channel_tx_seqs.sv"

//`include "channel_rx_monitor.sv"
`include "channel_rx_sequencer.sv"
`include "channel_rx_driver.sv"
`include "channel_rx_agent.sv"
`include "channel_rx_seqs.sv"

`include "channel_env.sv"

`endif // CHANNEL_SVH

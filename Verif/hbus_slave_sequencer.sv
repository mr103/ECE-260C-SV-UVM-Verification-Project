

`ifndef HBUS_SLAVE_SEQUENCER_SV
`define HBUS_SLAVE_SEQUENCER_SV

//------------------------------------------------------------------------------
//
// CLASS: hbus_slave_sequencer
//
//------------------------------------------------------------------------------

class hbus_slave_sequencer extends uvm_sequencer #(hbus_transaction);

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils(hbus_slave_sequencer)

  // new - constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass : hbus_slave_sequencer

`endif // HBUS_SLAVE_SEQUENCER_SV

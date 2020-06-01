interface channel_if (input clock, input reset );
timeunit 1ns;
timeprecision 100ps;
  // Actual Signals
  logic              data_vld;
  logic              suspend;
  logic       [7:0]  data;
  
  // Control flags
  bit                has_checks = 1;
  bit                has_coverage = 1;

endinterface : channel_if


`include "../RTL/binary_search_controller.sv"
`include "../RTL/binary_search.sv"
`timescale 1ns/1ns
module binary_search_tb ();
//_________________________________________________//
//________________module parameters_____________________//
//______________________________________________//
parameter DATA_WIDTH=8;
parameter ARRAY_SIZE=10;
//----------------------------------
parameter clk_period = 12;

//_______________________________________________// 
//________________instantiation__________________// 
//_______________________________________________// 
     logic rst_n;
     logic clk;
     logic start_tb ;
     logic  [DATA_WIDTH-1:0] in_data_tb [0:ARRAY_SIZE-1] ;
     logic  [DATA_WIDTH-1:0] element_tb ;
     logic [$clog2(ARRAY_SIZE)-1:0] index_tb ;
     logic found_tb , not_found_tb ;
//_______________________________________________// 
//________________instantiation__________________// 
//_______________________________________________// 
   binary_search #( .DATA_WIDTH(8) , .ARRAY_SIZE(10)) binary_search_inst
        (
       .clk(clk),.rst_n(rst_n),
       .start(start_tb),
       .in_data(in_data_tb) ,
       .element(element_tb) ,
       .index(index_tb) ,
       .found(found_tb) , .not_found(not_found_tb) 
  );
//_______________________________________________// 
//________________ stimuls ______________________// 
//_______________________________________________// 
`ifdef test1
  `include "TEST_CASES/test_case1.sv"
  `endif
 `ifdef test2
   `include "TEST_CASES/test_case2.sv"
 `endif
initial begin
    maintask();
end
endmodule 
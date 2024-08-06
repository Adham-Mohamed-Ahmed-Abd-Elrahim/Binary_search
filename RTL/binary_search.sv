module binary_search #(
    parameter DATA_WIDTH= 8 , ARRAY_SIZE=10
) (
    input clk,rst_n,
    input start,
    input  [DATA_WIDTH-1:0] in_data [0:ARRAY_SIZE-1] ,
    input  [DATA_WIDTH-1:0] element ,
    output [$clog2(ARRAY_SIZE)-1:0] index ,
    output found , not_found 
);
    // -------------------- Internal Signals --------------- // 
        reg  eq , gt ; // eq = equal  ,  gt= greater 
        wire  [$clog2(ARRAY_SIZE)-1:0] center ;
    // -------------------- comparator  -------------------- // 
    always @ (*)begin
        gt='b0;
        eq='b0;
        if (in_data[center]==element)begin
            eq=1'b1;
        end
        else if(in_data[center]>element)begin
            gt=1'b1;
        end
   
    end
    // -------------------- Instances  -------------------- // 
     binary_search_controller #(.ARRAY_SIZE(ARRAY_SIZE) ) binary_search_controller_inst
      (
             .clk(clk), .rst_n(rst_n) ,
             .start(start), .eq(eq) , .gt(gt), // eq = equal flag  , gt = greater than
             .found(found) , .not_found(not_found) , 
             .center(center) 
        );
     // -------------------- Outputs Assignment  ------------ //    
     assign index = center ;

endmodule
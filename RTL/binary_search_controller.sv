module binary_search_controller #(
    parameter ARRAY_SIZE=10 
) (
    input clk, rst_n ,
    input start, eq , gt, // eq = equal flag  , gt = greater than
    output found , not_found , 
    output [$clog2(ARRAY_SIZE)-1:0] center 
);

// -------------------- Internal Signals --------------- // 
    reg found_nx , found_r ; // 
    reg not_found_nx , not_found_r ; 
    reg [$clog2(ARRAY_SIZE):0] center_nx , center_r ;
    reg [$clog2(ARRAY_SIZE)-1:0] left_corner_nx , left_corner_r ;
    reg [$clog2(ARRAY_SIZE)-1:0] right_corner_nx , right_corner_r ;
    // -----------------  States  ---------------------- //
    enum bit {IDLE , PROCESS } current_state , next_state ;

// ---------------------- SEQ ALWAYS BLOCK ---------------- //
    always @ (posedge clk , negedge rst_n) begin
        if(!rst_n)begin
            current_state       <= IDLE;
            found_r             <='b0;
            not_found_r         <='b0;
            center_r            <='b0;
            left_corner_r       <='b0;
            right_corner_r      <='b0;
        end
        else begin
            current_state       <= next_state;
            found_r             <=found_nx;
            not_found_r         <=not_found_nx;
            center_r            <=center_nx;
            left_corner_r       <=left_corner_nx;
            right_corner_r      <=right_corner_nx;
        end
    end    

// ---------------------- COMB ALWAYS BLOCK ---------------- //
    always @(*)begin
            next_state          = current_state;
            found_nx            ='b0;
            not_found_nx        ='b0;
            center_nx           =center_r;
            left_corner_nx      =left_corner_r;
            right_corner_nx     =right_corner_r;
            case(current_state)
                IDLE:begin
                    if(start==1'b1)begin
                       left_corner_nx='b0;
                       right_corner_nx=ARRAY_SIZE; //check
                       center_nx=(ARRAY_SIZE)>>1;
                       next_state=PROCESS;
                    end
                end
                PROCESS:begin
                    if(left_corner_r > right_corner_r) begin //end of the process & element is not found
                        not_found_nx=1'b1;
                        next_state=IDLE;
                    end
                    else begin
                        if(eq==1'b1)begin
                            found_nx=1'b1;
                            next_state=IDLE;
                        end
                        else if (gt==1'b1)begin
                            right_corner_nx=center_r-1;
                        end
                        else begin
                            left_corner_nx=center_r +1;
                        end
                            center_nx=(right_corner_nx+left_corner_nx)>>1 ;
                    end
                end
            endcase
    end
    // --------------- Outputs Assignments ------------- //
    assign center           = center_r[$clog2(ARRAY_SIZE)-1:0];
    assign found            = found_r;
    assign not_found        = not_found_r;
endmodule
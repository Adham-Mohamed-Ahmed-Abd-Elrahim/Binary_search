int i;
int tests ;// number of tests  
int test_num = 20;
logic  [DATA_WIDTH-1:0] temp [0:ARRAY_SIZE-1] ;
logic [$clog2(ARRAY_SIZE)-1:0] expected_index ;
task maintask;
  $display("============================================================");
  $display("=====================main task=====================",$realtime);
  $display("============================================================");
 fork  
  begin 
    clock_gen();
  end
  begin
    reset_init();
    data_entry();
 
  end
 join_any 
endtask //automatic

//--------------------------------------------------
 task automatic pulse(ref logic  signal);
  @(posedge clk) begin
    signal=1'b1;
  end
  @(posedge clk) begin
    signal=1'b0;
  end
endtask
//--------------------------------------------------
task clock_gen;
  $display("============================================================");
  $display("=====================clock_gen =====================",$realtime);
  $display("============================================================");
while(1) begin
clk=0;
#(clk_period/2);
clk=1;
#(clk_period/2);
end
endtask 
//---------------------------------------------------
task reset_init;
  $display("============================================================");
  $display("=====================reset =====================",$realtime);
  $display("============================================================");
rst_n=1;
#(clk_period/2);
rst_n=0;
#(clk_period/2);
rst_n=1;

endtask 
//--------------------------------------------------
task data_entry;
  $display("============================================================");
  $display("=====================data_entry =====================",$realtime);
  $display("============================================================");
  
 for(tests=0;tests<test_num;tests=tests+1) begin
    for(i=0;i<ARRAY_SIZE;i=i+1)begin
       temp[i] = $urandom_range(0,16);
    end 

    temp.sort();                               // Sorting Array in a decending way

        for(i=0;i<ARRAY_SIZE;i=i+1)begin
       $display("##############data[%d]=%d =====================",i,in_data_tb[i]);
    end 
    //  Assignments 
 
    @(posedge clk)begin
      in_data_tb=temp;
      start_tb=1'b1;
      expected_index=$urandom_range(8,ARRAY_SIZE-1);
      element_tb=temp[expected_index]+1;
      $display("##############element=%d =====================",element_tb);
      $display("##############expected_index=%d =====================",expected_index);
    end
    @(posedge clk)  start_tb=1'b0;
    wait(found_tb|not_found_tb);
  
 end 

endtask


//----------------------------------------------

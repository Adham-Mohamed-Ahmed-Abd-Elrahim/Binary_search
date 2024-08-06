
int i ;
int k;
logic [DATA_SIZE-1:0] out [0:TRAIN_LENGTH-1];
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
    check();
  end
 join_any 
endtask //automatic

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
reset=1;
y_sample_in=1;
#12ns;
reset=0;
#12ns;
reset=1;

endtask 
//--------------------------------------------------
task data_entry;
  $display("============================================================");
  $display("=====================data_entry =====================",$realtime);
  $display("============================================================");
  i=TRAIN_LENGTH-1;
  k=0;
  repeat(TRAIN_LENGTH) @(posedge clk)begin
   y_sample_in = y_samples[i];
   if(i<=TRAIN_LENGTH-3)begin
   out[k]=x_corr_out;
   k=k+1;
   $display("##############x_corr_out=%d =====================",x_corr_out);
  end
   $display("##############y_sample=%d =====================\n",y_sample_in);
     
   i=i-1;
   
   end
 repeat(2) @(posedge clk)begin
  out[k]=x_corr_out;
   k=k+1;
   $display("##############x_corr_out=%d =====================",x_corr_out);
 end
endtask
//----------------------------------------------
task check;
  $display("============================================================");
  $display("=====================check =====================",$realtime);
  $display("============================================================");
 for(i=0;i<TRAIN_LENGTH;i++) begin
    $display("x_corr_out=%d &&  x_corr_out_ref",out[i],x_corr_out_ref[i]); 
 end 
  /*  if(out[i]==(x_corr_out_ref[i])) begin
       $display("##############Passed =====================");
    end
    else begin
          $display("##############failed =====================");
    end
 end*/
endtask

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
//////////////////////////////////////////////////////////////////////////////////


module mac_tb#(
    parameter DATA_WIDTH = 2,
              OUT_WIDTH = 4
)(

    );
    
   //Signals Instantiation 
   reg clk;
  
   reg [DATA_WIDTH  - 1: 0] a;
   reg [DATA_WIDTH  - 1: 0] b;
   reg [DATA_WIDTH  - 1: 0] c;
   wire [OUT_WIDTH-1: 0] out;
   
   
   //Module instantiation
   mac#(
            .DATA_WIDTH(DATA_WIDTH),
            .OUT_WIDTH(OUT_WIDTH)
) mac_dut(  
        .clk(clk), .a(a), .b(b), .c(c), .out(out)
         );
    
   
   always #5 clk = ~clk;
   
   initial
   begin
    clk = 0;
    reset = 1;
    a = 0;
    b = 0;
    c = 0;
    
 
    
    #5
    a = 4'b0011;  
    b = 4'b0101; 
    c = 4'b0111; //expected out = 3*5 + 7 = 22 (16)
    
    #10
    a = 4'b1001;  
    b = 4'b0111; 
    c = 4'b0100; //expected out = 9*7 + 4 = 67 (43)
    
    #10
    a = 4'b1101;  
    b = 4'b1001; 
    c = 4'b0101; //expected out = 13*9 + 5 = 122 (7A)
    
    #10
    a = 4'b1111;  
    b = 4'b1111; 
    c = 4'b1111; //expected out = 15*15 + 15 = 240 (F0)
    
   end
    
    
endmodule

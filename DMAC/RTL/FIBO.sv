module FIBO
(
    input   wire            clk,
    input   wire            rst,
    input   wire            enable,
    output  wire [31:0]     sum
);

reg [31:0] cur_num;
reg [31:0] next_num;

always @(posedge clk or negedge rst)
    if (!rst)
        cur_num <= #1 32'b0;    // initialize to 0
    else if (enable)
        cur_num <= next_num;

always @(posedge clk or negedge rst)
    if (!rst)
        next_num    <= 32'b1;
    else if (enable)
        next_num    <= sum;

assign sum = cur_num + next_num;        

endmodule

module FIBO
(
    input   wire            clk,
    input   wire            rst_n,
    input   wire            enable,
    output  wire [31:0]     sum
);

reg [31:0] cur_num;
reg [31:0] next_num;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        cur_num <= #1 32'b0;    // initialize to 0
    else if (enable)
        cur_num <= next_num;

always @(posedge clk or negedge rst_n)
    if (!rst_n)
        next_num    <= 32'b1;
    else if (enable)
        next_num    <= sum;

assign sum = cur_num + next_num;        

endmodule

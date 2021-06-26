`timescale 1ns/1ns

module MEM(clk,mem_read_ctrl,mem_write_ctrl,mem_address,mem_data_write,mem_data_read);

input clk;
input mem_read_ctrl;
input mem_write_ctrl;


//declaring these two as wires as they are being fed by the pipeline register EX_MEM 
input [2:0] mem_address;
input [2:0] mem_data_write;

output reg [2:0]mem_data_read;

//defining ram within this module itself
reg [2:0] mem_ram [0:39];

always@(negedge clk)
begin
    if(mem_read_ctrl && !mem_write_ctrl)
        mem_data_read=mem_ram[mem_address];
    if(!mem_read_ctrl && mem_write_ctrl)
        mem_ram[mem_address]=mem_data_write;
end

endmodule

`timescale 1ns / 1ns

module counter (
    input  wire sys_clk,
    input  wire sys_rst_n,
    output reg  led_out
);

    parameter [24:0] max = 25'd25000000;
    reg [24:0] cnt;


    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            cnt <= 25'd0;
        else if (cnt == max - 25'd1)
            cnt <= 25'd0;
        else
            cnt <= cnt + 25'd1;
    end


    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            led_out <= 1'b0;
        else if (cnt == max - 25'd1)
            led_out <= ~led_out;
    end

endmodule
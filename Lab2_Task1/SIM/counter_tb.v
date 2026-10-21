`timescale 1ns / 1ns
module counter_tb;
    reg sys_clk;
    reg sys_rst_n;
    wire led_out;

    counter 
    #(
        .max(25'd4)
    ) dut (
        .sys_clk   (sys_clk),
        .sys_rst_n (sys_rst_n),
        .led_out   (led_out)
    );

    initial sys_clk = 0;
    always #10 sys_clk = ~sys_clk;

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
        
        sys_rst_n = 0;
        #25 sys_rst_n = 1;

        #260 sys_rst_n = 0;
        #20 sys_rst_n = 1;

        #200 $finish;
    end
endmodule
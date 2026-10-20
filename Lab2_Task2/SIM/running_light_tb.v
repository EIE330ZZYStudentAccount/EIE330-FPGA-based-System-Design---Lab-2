`timescale 1ns / 1ns
module running_light_tb;
    reg sys_clk;
    reg sys_rst_n;
    wire [3:0] led_lights;

    running_light #(
        .counter_max(4)
    ) dut (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .led_lights(led_lights)
    );

    initial sys_clk = 0; 
    always #10 sys_clk = ~sys_clk;

    initial begin
        $dumpfile("running_light_tb.vcd");
        $dumpvars(0, running_light_tb);

        sys_rst_n = 0;

        #25 sys_rst_n = 1;

        #330 sys_rst_n = 0;

        #100 sys_rst_n = 1;

        #500 sys_rst_n = 0;

        #200 $finish;
    end
endmodule
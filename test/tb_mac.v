module tb_mac;

parameter DATA_WIDTH = 32;

reg clk;
reg rst;
reg stb;
reg add_b_stb;
reg [DATA_WIDTH-1:0] in_mult;
reg [DATA_WIDTH-1:0] in_add;
reg [DATA_WIDTH-1:0] coeff;
wire [DATA_WIDTH-1:0] mac_out;

mac dut(
    .clk(clk),
    .rst(rst),
    .stb(stb),
    .add_b_stb(add_b_stb),
    .in_mult(in_mult),
    .in_add(in_add),
    .coeff(coeff),
    .mac_out(mac_out)
);

initial begin
    $dumpfile("../sim/tb_mac.vcd");
    $dumpvars(0, tb_mac);
end

always #5 clk = ~clk;

initial clk = 0;

initial begin
    #2;
    rst = 1;
    #5;
    stb = 0;
    add_b_stb = 0;
    #10;
    rst = 0;
    /* mac_out = (in_mult * coeff) + in_add; */
    in_mult = 32'h40000000;
    coeff = 32'h40000000;
    stb = 1;
    #200;
    in_add = 32'h40000000;
    add_b_stb = 1;
    #200;
    $finish;
end

initial begin
    $monitor(
        "in_mult: %x, coeff: %x, in_add: %x\nmac_out: %x",
        in_mult, coeff, in_mult, mac_out
    );
end

endmodule


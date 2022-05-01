module tb_adder;

reg clk;
reg rst;

reg [31:0] input_a;
reg input_a_stb;
wire input_a_ack;

reg [31:0] input_b;
reg input_b_stb;
wire input_b_ack;

wire [31:0] output_z;
wire output_z_stb;
reg output_z_ack;


adder dut(
    // inputs
    .input_a(input_a),
    .input_b(input_b),
    .input_a_stb(input_a_stb),
    .input_b_stb(input_b_stb),
    .output_z_ack(output_z_ack),
    .clk(clk),
    .rst(rst),
    // outputs
    .output_z(output_z),
    .output_z_stb(output_z_stb),
    .input_a_ack(input_a_ack),
    .input_b_ack(input_b_ack)
);

initial begin
    $dumpfile("../sim/tb_adder.vcd");
    $dumpvars(0, tb_adder);
end

always #5 clk = ~clk;

initial clk = 0;

initial begin
    #2;
    rst = 1;
    #5;
    input_a_stb = 0;
    input_b_stb = 0;
    output_z_ack = 0;
    #10;
    rst = 0;
    input_a = 32'h40200000;
    input_b = 32'hbfc00000;
    input_a_stb = 1;
    input_b_stb = 1;
    #200;
    $finish;
end

initial begin
    /* $monitor("a: %x, b: %x, z: %x", input_a, input_b, output_z); */
    $monitor("a: %x, b: %x, z: %x", input_a, input_b, output_z);
end


endmodule

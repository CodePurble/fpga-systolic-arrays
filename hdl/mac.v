module mac(
    clk,
    rst,
    stb,
    add_b_stb,
    in_mult,
    in_add,
    coeff,
    mac_out
);

parameter DATA_WIDTH = 32;

input clk;
input rst;
input stb;
input add_b_stb;
input [DATA_WIDTH-1:0] in_mult;
input [DATA_WIDTH-1:0] in_add;
input [DATA_WIDTH-1:0] coeff;
output [DATA_WIDTH-1:0] mac_out;

// input wires
wire mul_z_ack;
assign mul_z_ack = 1;

// output wires
wire mul_a_ack;
wire mul_b_ack;
wire mul_z_stb;
wire [DATA_WIDTH-1:0] mul_out;

/* mac_out = (in_mult * coeff) + in_add; */
multiplier mul1(
    // inputs
    .clk(clk),
    .rst(rst),
    .input_a(in_mult),
    .input_a_stb(stb),
    .input_b(coeff),
    .input_b_stb(stb),
    .output_z_ack(mul_z_ack),
    // outputs
    .input_a_ack(mul_a_ack),
    .input_b_ack(mul_b_ack),
    .output_z_stb(mul_z_stb),
    .output_z(mul_out)
);

adder ad1(
    // inputs
    .clk(clk),
    .rst(rst),
    .input_a(in_mult),
    .input_a_stb(mul_z_stb),
    .input_b(coeff),
    .input_b_stb(add_b_stb),
    .output_z_ack(mul_z_ack),
    // outputs
    .input_a_ack(mul_a_ack),
    .input_b_ack(mul_b_ack),
    .output_z_stb(mul_z_stb),
    .output_z(mul_out)
);


endmodule

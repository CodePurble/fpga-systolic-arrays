# fpga-systolic-arrays
Systolic array implementations and examples. Details on the FPGA platform will
be added later.

# TODO
- [ ] Matrix multiplier
- [ ] Convolution
- [ ] Filter banks

# Running testbenches
* Needs `iverilog`
* Command: `iverilog -Wall -c"cmdfile" -o <outfile> <verilog_file> && vvp <outfile>`

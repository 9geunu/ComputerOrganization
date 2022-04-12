// imm_generator.v

module imm_generator #(
  parameter DATA_WIDTH = 32
)(
  input [31:0] instruction,

  output reg [DATA_WIDTH-1:0] sextimm
);

wire [6:0] opcode;
assign opcode = instruction[6:0];

always @(*) begin
  case (opcode)
    //////////////////////////////////////////////////////////////////////////
    // TODO : Generate sextimm using instruction
    //////////////////////////////////////////////////////////////////////////
    7'b0010011: sextimm = { {21{instruction[31]}}, instruction[30:20] }; // I-type
    7'b0000011: sextimm = { {21{instruction[31]}}, instruction[30:20] }; // Load
    7'b0100011: sextimm = { {21{instruction[31]}}, instruction[30:25], instruction[11:7] }; // Store
    default:    sextimm = 32'h0000_0000;
  endcase
end


endmodule

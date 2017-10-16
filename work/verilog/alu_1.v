/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_1 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out
  );
  
  
  
  wire [8-1:0] M_add_s;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [2-1:0] M_add_alufn_add;
  reg [8-1:0] M_add_a;
  reg [8-1:0] M_add_b;
  adder_4 add (
    .alufn_add(M_add_alufn_add),
    .a(M_add_a),
    .b(M_add_b),
    .s(M_add_s),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  
  wire [8-1:0] M_compare_cmp;
  reg [2-1:0] M_compare_alufn_cmp;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  comparer_5 compare (
    .alufn_cmp(M_compare_alufn_cmp),
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .cmp(M_compare_cmp)
  );
  
  wire [8-1:0] M_boole_boole;
  reg [4-1:0] M_boole_alufn_boole;
  reg [8-1:0] M_boole_a;
  reg [8-1:0] M_boole_b;
  boolean_6 boole (
    .alufn_boole(M_boole_alufn_boole),
    .a(M_boole_a),
    .b(M_boole_b),
    .boole(M_boole_boole)
  );
  
  wire [8-1:0] M_shift_shift;
  reg [2-1:0] M_shift_alufn_shift;
  reg [8-1:0] M_shift_a;
  reg [8-1:0] M_shift_b;
  shifter_7 shift (
    .alufn_shift(M_shift_alufn_shift),
    .a(M_shift_a),
    .b(M_shift_b),
    .shift(M_shift_shift)
  );
  
  always @* begin
    M_add_alufn_add = alufn[0+1-:2];
    M_add_a = a;
    M_add_b = b;
    M_compare_alufn_cmp = alufn[1+1-:2];
    M_compare_v = M_add_v;
    M_compare_n = M_add_n;
    M_compare_z = M_add_z;
    M_boole_alufn_boole = alufn[0+3-:4];
    M_boole_a = a;
    M_boole_b = b;
    M_shift_alufn_shift = alufn[0+1-:2];
    M_shift_a = a;
    M_shift_b = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_add_s;
      end
      2'h1: begin
        out = M_boole_boole;
      end
      2'h2: begin
        out = M_shift_shift;
      end
      2'h3: begin
        out = M_compare_cmp;
      end
      default: begin
        out = 8'h00;
      end
    endcase
  end
endmodule

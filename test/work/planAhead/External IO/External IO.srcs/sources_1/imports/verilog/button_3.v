/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module button_3 (
    input clk,
    input rst,
    input [2:0] button,
    output reg [2:0] button_pressed
  );
  
  
  
  wire [1-1:0] M_buttonR_cond_out;
  reg [1-1:0] M_buttonR_cond_in;
  button_conditioner_9 buttonR_cond (
    .clk(clk),
    .in(M_buttonR_cond_in),
    .out(M_buttonR_cond_out)
  );
  wire [1-1:0] M_buttonR_edge_out;
  reg [1-1:0] M_buttonR_edge_in;
  edge_detector_10 buttonR_edge (
    .clk(clk),
    .in(M_buttonR_edge_in),
    .out(M_buttonR_edge_out)
  );
  wire [1-1:0] M_buttonY_cond_out;
  reg [1-1:0] M_buttonY_cond_in;
  button_conditioner_9 buttonY_cond (
    .clk(clk),
    .in(M_buttonY_cond_in),
    .out(M_buttonY_cond_out)
  );
  wire [1-1:0] M_buttonY_edge_out;
  reg [1-1:0] M_buttonY_edge_in;
  edge_detector_10 buttonY_edge (
    .clk(clk),
    .in(M_buttonY_edge_in),
    .out(M_buttonY_edge_out)
  );
  wire [1-1:0] M_buttonB_cond_out;
  reg [1-1:0] M_buttonB_cond_in;
  button_conditioner_9 buttonB_cond (
    .clk(clk),
    .in(M_buttonB_cond_in),
    .out(M_buttonB_cond_out)
  );
  wire [1-1:0] M_buttonB_edge_out;
  reg [1-1:0] M_buttonB_edge_in;
  edge_detector_10 buttonB_edge (
    .clk(clk),
    .in(M_buttonB_edge_in),
    .out(M_buttonB_edge_out)
  );
  
  always @* begin
    M_buttonR_cond_in = button[0+0-:1];
    M_buttonR_edge_in = M_buttonR_cond_out;
    M_buttonY_cond_in = button[1+0-:1];
    M_buttonY_edge_in = M_buttonY_cond_out;
    M_buttonB_cond_in = button[2+0-:1];
    M_buttonB_edge_in = M_buttonB_cond_out;
    button_pressed[0+0-:1] = M_buttonR_edge_out;
    button_pressed[1+0-:1] = M_buttonY_edge_out;
    button_pressed[2+0-:1] = M_buttonB_edge_out;
  end
endmodule

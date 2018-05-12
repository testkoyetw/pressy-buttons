/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input sum,
    input carry,
    output reg a,
    output reg b,
    output reg c
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  localparam A_state = 4'd0;
  localparam B_state = 4'd1;
  localparam C_state = 4'd2;
  localparam D_state = 4'd3;
  localparam E_state = 4'd4;
  localparam F_state = 4'd5;
  localparam G_state = 4'd6;
  localparam H_state = 4'd7;
  localparam I_state = 4'd8;
  localparam J_state = 4'd9;
  localparam K_state = 4'd10;
  
  reg [3:0] M_state_d, M_state_q = A_state;
  
  localparam X = 5'h1d;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    a = 1'h0;
    b = 1'h0;
    c = 1'h0;
    io_led[0+7-:8] = {4'h8{sum}};
    io_led[16+7-:8] = {4'h8{carry}};
    
    case (M_state_q)
      I_state: begin
        M_counter_d = 1'h0;
        led = 8'h00;
        if (io_dip[0+0+0-:1] == 1'h1) begin
          M_state_d = A_state;
        end
      end
      A_state: begin
        a = 1'h0;
        b = 1'h0;
        c = 1'h0;
        led[0+0-:1] = 1'h0;
        led[1+0-:1] = 1'h0;
        led[2+0-:1] = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h0 & sum == 1'h0) begin
          M_counter_d = 1'h0;
          M_state_d = B_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h0 & sum == 1'h0)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      B_state: begin
        a = 1'h0;
        b = 1'h0;
        c = 1'h1;
        led[0+0-:1] = 1'h0;
        led[1+0-:1] = 1'h0;
        led[2+0-:1] = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h0 & sum == 1'h1) begin
          M_counter_d = 1'h0;
          M_state_d = C_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h0 & sum == 1'h1)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      C_state: begin
        a = 1'h0;
        b = 1'h1;
        c = 1'h0;
        led[0+0-:1] = 1'h0;
        led[1+0-:1] = 1'h1;
        led[2+0-:1] = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h0 & sum == 1'h1) begin
          M_counter_d = 1'h0;
          M_state_d = D_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h0 & sum == 1'h1)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      D_state: begin
        a = 1'h0;
        b = 1'h1;
        c = 1'h1;
        led[0+0-:1] = 1'h0;
        led[1+0-:1] = 1'h1;
        led[2+0-:1] = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h1 & sum == 1'h0) begin
          M_counter_d = 1'h0;
          M_state_d = E_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h1 & sum == 1'h0)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      E_state: begin
        a = 1'h1;
        b = 1'h0;
        c = 1'h0;
        led[0+0-:1] = 1'h1;
        led[1+0-:1] = 1'h0;
        led[2+0-:1] = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h0 & sum == 1'h1) begin
          M_counter_d = 1'h0;
          M_state_d = F_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h0 & sum == 1'h1)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      F_state: begin
        a = 1'h1;
        b = 1'h0;
        c = 1'h1;
        led[0+0-:1] = 1'h1;
        led[1+0-:1] = 1'h0;
        led[2+0-:1] = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h1 & sum == 1'h0) begin
          M_counter_d = 1'h0;
          M_state_d = G_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h1 & sum == 1'h0)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      G_state: begin
        a = 1'h1;
        b = 1'h1;
        c = 1'h0;
        led[0+0-:1] = 1'h1;
        led[1+0-:1] = 1'h1;
        led[2+0-:1] = 1'h0;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h1 & sum == 1'h0) begin
          M_counter_d = 1'h0;
          M_state_d = H_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h1 & sum == 1'h0)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      H_state: begin
        a = 1'h1;
        b = 1'h1;
        c = 1'h1;
        led[0+0-:1] = 1'h1;
        led[1+0-:1] = 1'h1;
        led[2+0-:1] = 1'h1;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[29+0-:1] == 1'h1 & carry == 1'h1 & sum == 1'h1) begin
          M_counter_d = 1'h0;
          M_state_d = J_state;
        end else begin
          if (M_counter_q[29+0-:1] == 1'h1 & !(carry == 1'h1 & sum == 1'h1)) begin
            M_counter_d = 1'h0;
            M_state_d = K_state;
          end
        end
      end
      J_state: begin
        M_counter_d = 1'h0;
        led = 8'h00;
        io_led = 24'hffffff;
        a = 1'h0;
        b = 1'h0;
        c = 1'h0;
        if (io_dip[0+0+0-:1] == 1'h0) begin
          M_state_d = I_state;
        end
      end
      K_state: begin
        M_counter_d = 1'h0;
        led = 8'hff;
        a = 1'h0;
        b = 1'h0;
        c = 1'h0;
        if (io_dip[0+0+0-:1] == 1'h0) begin
          M_state_d = I_state;
        end
      end
      default: begin
        a = 1'h0;
        b = 1'h0;
        c = 1'h0;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
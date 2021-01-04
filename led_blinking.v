`timescale 1us / 1ns

module led_blinking(
    input i_clk,
    input i_enable,
    input i_sw1,
    input i_sw2,
    output wire led_drive
    );
    
    // Input clock of 125MHZ
    
    parameter c_clk_5hz = 25000000;
    parameter c_clk_50hz = 2500000;
    parameter c_clk_10hz = 12500000;
    parameter c_clk_1hz = 125000000;
    
    // Variables for counting signals and toggling 
    reg [31:0]  r_clk_5hz = 0;
    reg [31:0] r_clk_50hz = 0;
    reg [31:0] r_clk_10hz = 0;
    reg [31:0] r_clk_1hz = 0;
    
    reg r_toggle_5hz = 1'b0;
    reg r_toggle_50hz = 1'b0;
    reg r_toggle_10hz = 1'b0;
    reg r_toggle_1hz = 1'b0;
    
    // On/Off select
    
    reg r_bit_led;
    wire w_bit_led;
    
begin 

// Check 5hz 
always @ (posedge i_clk)
    begin
        if (r_clk_5hz == c_clk_5hz-1)
            begin 
                r_toggle_5hz <= !r_toggle_5hz;
                r_clk_5hz <= 0;
            end
        else r_clk_5hz <= r_clk_5hz+1;
    end

// Check 50hz 
always @ (posedge i_clk)
    begin
        if (r_clk_50hz == c_clk_50hz-1)
            begin 
                r_toggle_50hz <= !r_toggle_50hz;
                r_clk_50hz <= 0;
            end
        else r_clk_50hz <= r_clk_50hz+1;
    end       
    
// Check 10hz 
always @ (posedge i_clk)
    begin
        if (r_clk_10hz == c_clk_10hz-1)
            begin 
                r_toggle_10hz <= !r_toggle_10hz;
                r_clk_10hz <= 0;
            end
        else r_clk_10hz <= r_clk_10hz+1;
    end  

// Check 1hz 
always @ (posedge i_clk)
    begin
        if (r_clk_1hz == c_clk_1hz-1)
            begin 
                r_toggle_1hz <= !r_toggle_1hz;
                r_clk_1hz <= 0;
            end
        else r_clk_1hz <= r_clk_1hz+1;
    end       

// Programming the multiplexer    
always @ (*)
    begin
        case({i_sw1, i_sw2})
            2'b11 : r_bit_led <= r_toggle_1hz;
            2'b10 : r_bit_led <= r_toggle_10hz;
            2'b01 : r_bit_led <= r_toggle_50hz;
            2'b00 : r_bit_led <= r_toggle_5hz;
        endcase
    end
    
assign led_drive = r_bit_led & i_enable;

end

endmodule

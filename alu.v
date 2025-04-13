module alu (
    input [3:0] A,
    input [3:0] B,
    input [2:0] sel,
    output reg [3:0] Y,
    output reg carry_out
);

    always @(*) begin
        case (sel) 
        3'b000 : begin  //A+B
        {carry_out, Y} = A + B;
        end
        3'b001: begin //A-B
        {carry_out, Y} = A - B;
        end
        3'b010 : begin //A OR B
        Y = A | B;
        carry_out = 0;
        end
        3'b100: begin // A^B
        Y = A ^ B;
        carry_out = 0;
        end
        3'b101: begin //NOT A
        Y = ~A;
        carry_out = 0;
        end
        3'b110: begin // A + 1
        {carry_out, Y} = A + 1;
        end
        3'b111: begin // A - 1
        {carry_out,  Y} = A - 1;
        end
        default: begin
            Y = 4'b0000;
            carry_out = 0;
        end
        endcase    
    end
endmodule
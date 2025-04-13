`timescale 1ns/1ps

module alu_tb;
    
    //Input to the ALU
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] sel;

    //Output from the ALU
    wire [3:0] Y;
    wire carry_out;

    alu uut (
        .A(A), .B(B), .sel(sel),
        .carry_out(carry_out),
        .Y(Y)
    );

    initial begin
        $monitor("Time = %0d | A = %b | B = %b | sel = %b | Y = %b | carry_out = %b", $time, A, B, sel, Y, carry_out);

        A = 4'b0011; B = 4'b0101; sel = 3'b000; #10;  //3+5 = 8

        A =  4'b1000; B = 4'b0011; sel = 3'b001; #10; //8-3 = 5

        A = 4'b1100;  B = 4'b1010; sel = 3'b010; #10; // 1100 & 1010 = 1000

        A = 4'b1100; B = 4'b1010; sel = 3'b011; #10; //1100 | 1010 =  1110

        A = 4'b1100; B = 4'b1010; sel = 3'b100; #10; // 1100 ^ 1010 = 0110
        
        A = 4'b1100; B = 4'b0000; sel = 3'b101; #10; // ~1100 = 0011

        A = 4'b0111; B = 4'b0000; sel = 3'b110; #10; //0111 + 1 = 1000

        A = 4'b1000; B = 4'b0000; sel = 3'b111; #10;  // 1000 - 1 = 0111

        $finish;
    end
endmodule

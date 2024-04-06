module top_module(clk,reset,in,out);
    input clk;
    input reset;    
    input in;
    output out;

    reg out;
    reg present_state,next_state;
    parameter A=0,B=1;
    always @(posedge clk) begin
        if (reset) begin  
            present_state=B;
        end else begin
            present_state=next_state;
        end
    end
    always @(*) begin
        case (present_state)
            A:next_state=in?A:B;
            B:next_state=in?B:A;
        endcase
    end
    assign out=(present_state==B);
endmodule

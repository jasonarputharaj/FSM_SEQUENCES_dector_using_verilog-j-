module FSM(input din,clk,reset,output out);
//to initialte the parameter for the state
parameter idel=2'b00,state1=2'b01,state2=2'b10,state3=2'b11;
//fsm made of combinational and sequential logic
//sequential logic 
reg [1:0] present_state,nxt_state;
always@(posedge clk)
if(reset)
present_state<=idel;
else
present_state<=nxt_state;
//combinatioal logic to deact the sequence of numbers 101
always@(din,present_state)
begin
case(present_state)
idel:if(din==1)
nxt_state=state1;
else
nxt_state=idel;
state1:if(din==0)
nxt_state=state2;
else
nxt_state=state1;
state2:if(din==1)
nxt_state=state3;
else
nxt_state=state2;
state3:if(din==1)
nxt_state=state1;
else
nxt_state=state2;
default:nxt_state=idel;
endcase
end
//to get the output
assign out=(present_state==state3);
endmodule


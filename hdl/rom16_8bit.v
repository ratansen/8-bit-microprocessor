module rom16_8bit(
    input [3:0] addr,
    input low_o_en,               // Enable Output
    output reg [7:0] data_out,
    input [3:0] op_code,
    input [7:0] acc_out
);
    // reg [7:0] data_out;
    // reg [3:0] temp;
    // reg [7:0] addr_ratna;
    reg [7:0] mem [0:255];
    reg [7:0] buffer;
    reg [7:0] temp;
    initial
    begin
        mem[8'h0A]= 8'h45;
        mem[8'h08]= 8'h69;
    end
    
    // initial
    // begin
    // temp = ((addr[3])&1)? (4'b1111):(4'b0000);
    // addr_ratna = {temp,addr};
    // end

    // always @(write_ratna)
    // begin
    //     if (write_ratna) begin
    //     mem[addr_ratna] = data_in;
    //         $display("Memory: set [0x%h] => 0x%h (%d)", addr_ratna, data_out);
    //     end
    //     else
    //     begin
    //         buffer <= mem[addr_ratna];
    //     end
    // end

    always @(addr or low_o_en)
    begin
        //$display("low_o_en = %b",low_o_en);
        if(low_o_en)
        begin
            data_out = 8'bzzzzzzzz;
        end
        else
        begin
            //$display("%h ,data_out = %h",op_code, data_out);

            // Change the RHS values in the assignments below to change the program that the simulation runs.
            // The computer will subtract the value at address 0x9 from the value present in address 0x8 and display the output.
            // 1 - 8 = -7
            // The instructions are: 

            // LDA 0x8
            // SUB 0x9
            // OUT
            // HLT

            // Output: 0x11111001 (-7 as 2's complement)
            $display("opcode = %h ,addr =  %h ",op_code,addr);
            if(op_code==4'b0000 && addr!= 4'b0000 && addr !=4'b0010)
            begin
                temp= {4'b0000,addr};  ///extended 4 bit 
                data_out=mem[temp];
                $display("LDA %h ===> Load Immediate value which is store at %h to Accumulor   //you can check by displaying memory[address]",temp,temp);
                $display("memory[%h]=%h",temp,data_out);
                
            end
            else if(op_code==4'b1000 && addr !=4'b0010)
            begin
                temp= {4'b0000,addr};    ///extended 4 bit 
                mem[temp] = acc_out; 
                data_out= mem[temp];
                $display("STA %h ===> Store the Accumulator value to the address =%h  //you can check by displaying memory[address] ",temp,temp);
                $display("memory[%h]=%h",temp,acc_out);
            end

            else 
            begin
            case(addr)
                4'h0: data_out = 8'h08; // Program memory starts here.
                4'h1: data_out = 8'h19;
                4'h2: data_out = 8'hee;
                4'h3: data_out = 8'hff;
                4'h4: data_out = 8'h00;
                4'h5: data_out = 8'h00;
                4'h6: data_out = 8'h00;
                4'h7: data_out = 8'h00;
                4'h8: data_out = 8'h06; // Data memory starts from here.
                4'h9: data_out = 8'h07;
                4'ha: data_out = 8'h00;
                4'hb: data_out = 8'h00;
                4'hc: data_out = 8'h00;
                4'hd: data_out = 8'h00;
                4'he: data_out = 8'h00;
                4'hf: data_out = 8'h00;
            endcase
                
            $display("%h ,data_out = %h",addr, data_out);
            end
        end
        
    end
    // initial
    // begin
    // if(out_en_ratna)
    // data_out = buffer;
    // else
    // data_out = data_out;    
    // end
    
endmodule

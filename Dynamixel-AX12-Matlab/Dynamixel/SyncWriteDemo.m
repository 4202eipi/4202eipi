function SyncWriteDemo()
    loadlibrary('dynamixel','dynamixel.h');
    %libfunctions('dynamixel');
    res = calllib('dynamixel','dxl_initialize');
    pause on
    
    numberOfDynamixels = 2;
    
    if res == 1
        
        for i = 1:numberOfDynamixels
            id(1,i) = i;
            phase(1,i) = (2 * pi) * i/numberOfDynamixels;
        end
        
        %Broadcast id 0xFE
        calllib('dynamixel','dxl_set_txpacket_id',254);
        
        %Length is 14
        %That handles position and speed for two dynamixels
        calllib('dynamixel','dxl_set_txpacket_length',14);
        
        %SyncWrite instruction 0x83
        calllib('dynamixel','dxl_set_txpacket_instruction',131);
        
        %Starting address
        calllib('dynamixel','dxl_set_txpacket_parameter',0, 30);
        
        %length of data to write to each dynamixel
        calllib('dynamixel','dxl_set_txpacket_parameter',1, 4);
        
        %Parameters for syncwrite dynamixel id = 1
        % id | position | speed
        %ID = 1
        calllib('dynamixel','dxl_set_txpacket_parameter',2, 1);
        
        %Position = 512
        lowByte = calllib('dynamixel','dxl_get_lowbyte',512);
        highByte = calllib('dynamixel','dxl_get_highbyte', 512);
        calllib('dynamixel','dxl_set_txpacket_parameter',3, lowByte);
        calllib('dynamixel','dxl_set_txpacket_parameter',4, highByte);
        
        %Speed = 512
        lowByte = calllib('dynamixel','dxl_get_lowbyte',512);
        highByte = calllib('dynamixel','dxl_get_highbyte', 512);
        calllib('dynamixel','dxl_set_txpacket_parameter',5, lowByte);
        calllib('dynamixel','dxl_set_txpacket_parameter',6, highByte);
        
        
        %Parameters for syncwrite dynamixel id = 2
        % id | position | speed
        %ID = 2
        calllib('dynamixel','dxl_set_txpacket_parameter',7, 2);
        
        %Position = 512
        lowByte = calllib('dynamixel','dxl_get_lowbyte',512);
        highByte = calllib('dynamixel','dxl_get_highbyte', 512);
        calllib('dynamixel','dxl_set_txpacket_parameter',8, lowByte);
        calllib('dynamixel','dxl_set_txpacket_parameter',9, highByte);
        
        %Speed = 512
        lowByte = calllib('dynamixel','dxl_get_lowbyte',512);
        highByte = calllib('dynamixel','dxl_get_highbyte', 512);
        calllib('dynamixel','dxl_set_txpacket_parameter',10, lowByte);
        calllib('dynamixel','dxl_set_txpacket_parameter',11, highByte);

        %transmit
        calllib('dynamixel','dxl_tx_packet');      
        
    else
        disp('Failed to open USB2Dynamixel!');
    end
    calllib('dynamixel','dxl_terminate');
    unloadlibrary('dynamixel');
end
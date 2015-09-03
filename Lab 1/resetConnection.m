function [ ] = resetConnection(  )
    h=COM_OpenNXT();
    COM_SetDefaultNXT(h);
end


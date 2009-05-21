function [int16] = tcint2int(tcint16)           % Turns integer representation of two's complement in to real number

if (bitget(tcint16,16))                         % Is it negative?
    for i = 1:16                                % We change 0 to 1 and 1 to 0
        if (bitget(tcint16,i))
            tcint16 = bitset(tcint16,i,0);
        else
            tcint16 = bitset(tcint16,i,1);
        end
    end
    int16 = (tcint16+1) * (-1);                 % Plus 1 times -1
else
    int16 = tcint16;                            % If not, all is good
end

end
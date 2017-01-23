function index = STA_LTA(input_waveform)
%% STA/LTA
% This function determines the index of the P-wave first arrival.
% It uses  2 short time data. and 8 long time data.

thresh = 10; j = -1;

 p_up = input_waveform;

for i = 1: (length(p_up)-16)

    j = j + 1; 
LTA = sum(abs(p_up(1+j:8+j)));
STA = sum(abs(p_up(9+j:15+j)));

ratio = STA/LTA;

    if abs(ratio) > thresh
        index = i+8;
        break
    end

end


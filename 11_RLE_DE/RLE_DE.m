clc;clearvars;close all;
%% Part 1 : Generate 100 random bits

InpBits = round(rand(100,1));

%% Part 2 : Find the count of repeated bits
% Initialisation
PrevBit = InpBits(1); 
CurrBit = PrevBit; 
CurrBitCount = 0; 

Symbol = []; 
Count = []; 

for idx = 1:1:numel(InpBits)
    CurrBit = InpBits(idx); %Get the current Bit
    if(PrevBit == CurrBit) %Check if it same as previous bit
        CurrBitCount = CurrBitCount + 1;
    else
        Symbol = [Symbol,PrevBit]; %If not matching, then save last counted bit count
        Count = [Count,CurrBitCount];
        CurrBitCount = 1; %Reinitialise the Counter
    end
    PrevBit = CurrBit;
end
Symbol = [Symbol,PrevBit]; %Saving the details of last bit
Count = [Count,CurrBitCount];

%% Part 3 : Find the Run Length Code

BinCount = dec2bin(Count); %Get the binary equivalent of the Counts
RLECode = '';
for idx = 1:1:numel(Symbol)
    RLECode = strcat(RLECode,num2str(Symbol(idx)),BinCount(idx,:));
end

%% Part 4 : Find if the Encoding is +ve or -ve and find Compresion Ratio

if(length(InpBits) > length(RLECode))
    disp("Positive RLE");
    Compression_Ratio = (length(RLECode)/length(InpBits));
    disp(Compression_Ratio);
else
    disp("Negative RLE");
end

        
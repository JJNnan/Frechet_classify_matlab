function I=remove_waterband(I)
m=input('���������ˮ����������');
for a=1:m
    waterband_wave = input('��������ʼ���κţ���ʽ����[start end] = ');
    I(waterband_wave(1):waterband_wave(2))={[]};
end
 I(cellfun(@isempty,I))=[];
    

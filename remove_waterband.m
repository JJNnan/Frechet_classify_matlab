function I=remove_waterband(I)
m=input('请输入存在水汽波段数：');
for a=1:m
    waterband_wave = input('请输入起始波段号，形式如下[start end] = ');
    I(waterband_wave(1):waterband_wave(2))={[]};
end
 I(cellfun(@isempty,I))=[];
    

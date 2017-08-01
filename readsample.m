%读取samples文件夹下的所有样点(txt格式)
%参数为cell保存图片，lengthsample保存样品点
function [lengthsample,S,mysample]=readsample()

mysample=dir('.\\samples\*.txt');
lengthsample=length(mysample);
for j=1:lengthsample
    
    sampleName=strcat('.//samples/',mysample(j).name);
    S{j}= textread(sampleName);
    
end
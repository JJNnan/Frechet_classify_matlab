%��ȡsamples�ļ����µ���������(txt��ʽ)
%����Ϊcell����ͼƬ��lengthsample������Ʒ��
function [lengthsample,S,mysample]=readsample()

mysample=dir('.\\samples\*.txt');
lengthsample=length(mysample);
for j=1:lengthsample
    
    sampleName=strcat('.//samples/',mysample(j).name);
    S{j}= textread(sampleName);
    
end
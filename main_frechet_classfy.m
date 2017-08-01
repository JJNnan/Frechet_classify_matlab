%function main_frechet_classfy()
clear all;
[lengthfile,I,myfile]=readfile();
N=input('是否归一化处理图像(1是/0否)？\n');
if N==1
    I=normalize(I,lengthfile);
end

[lengthsample,S,mysample]=readsample();

%波段选择降维
H{1}=I{12};
H{2}=I{57};
H{3}=I{65};
H{4}=I{76};
H{5}=I{90};
H{6}=I{99};
H{7}=I{110};
H{8}=I{130};
H{9}=I{142};
H{10}=I{159};


sampleResult=classify_frechet(H,S,10,lengthsample,mysample);
classfyResult=classfy(H,myfile,lengthsample,sampleResult);


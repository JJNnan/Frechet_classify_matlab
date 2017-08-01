clear all;
[lengthfile,I,myfile]=readfile();
N=input('�Ƿ��һ������ͼ��(1��/0��)��\n');
if N==1
    I=normalize(I,lengthfile);
end

[lengthsample,S,mysample]=readsample();

%����ѡ��ά
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

lengthfile=10;
[row,column]=size(H{1});
xx=(1:lengthfile);
xx=xx';

%ȡ������sample�Ĺ��ױ���ΪSP
for m=1:lengthsample
     sam=size(S{m});
    for n=1:sam(1)
        for k=1:lengthfile
            SP{m}(n,k)=H{k}(S{m}(n,1),S{m}(n,2));
        end
    end
end
%ȡ�����ƽ��������
for k=1:lengthsample
    sam=size(S{k});
    SP_mean(k,:)=sum(SP{k})/sam(1);
end
%ȡ����i,j����Ԫ�Ĺ��ױ��浽IM  
for i=1:row
    for j=1:column
        for k=1:lengthfile
            IM{i,j}(k)=H{k}(i,j);
        end
    end
end
%����frechet����
for m=1:lengthsample
   for i=318:328
        for j=308:318
            sampleResult{m}(i-317,j-307)=frechet(xx,SP_mean(m,:)',xx,IM{i,j}');
        end
    end
end

min_ij=[];
for i=318:328
    for j=308:318
        for l=1:lengthsample
            min_ij(l)=sampleResult{l}(i-317,j-307);
        end
        [min_sample,p]=min(min_ij);
        classfyResult(i-317,j-307)=p;
    end
end

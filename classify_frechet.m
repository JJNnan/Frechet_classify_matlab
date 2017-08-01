function sampleResult=classify_frechet(I,S,lengthfile,lengthsample,mysample)
[row,column]=size(I{1});
xx=(1:lengthfile);
xx=xx';

%ȡ������sample�Ĺ��ױ���ΪSP
for m=1:lengthsample
     sam=size(S{m});
    for n=1:sam(1)
        for k=1:lengthfile
            SP{m}(n,k)=I{k}(S{m}(n,1),S{m}(n,2));
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
            IM{i,j}(k)=I{k}(i,j);
        end
    end
end
%����frechet����
for m=1:lengthsample
   for i=1:row
        for j=1:column
            sampleResult{m}(i,j)=frechet(xx,SP_mean(m,:)',xx,IM{i,j}');
        end
    end
end


for k=1:lengthsample
    figure2Name=strcat('��Ʒ��ȡ�����',mysample(k).name);
    figure('NumberTitle', 'off', 'name',figure2Name),imshow(sampleResult{k},[]); 
end
fprintf('����Ʒ���������ɣ�\n');

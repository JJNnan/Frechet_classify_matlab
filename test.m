%function sampleResult=classify_frechet(I,S)
[row,column]=size(I{1});
lengthfile=size(I);
lengthsample=size(S);
xx=(1:lengthfile(2));
%将每个像元光谱值扩大1000倍，方便计算
for  k=1:lengthfile(2)
        I{k}=I{k}*1000;
end
xx=xx';

    sam=size(S{1});
    
            %取出（i,j）像元的光谱保存到IM
            for k=1:lengthfile(2)
                IM(k)=I{k}(1,1);
            end
            %取出sample1的所有像元的光谱保存为sample_temp
            for n=1:sam(1)
                for k=1:lengthfile(2)
                    SP(n,k)=I{k}(S{1}(n,1),S{1}(n,2));
                end
                sample_class(n)=frechet(xx,IM',xx,SP(n,:)');
            end
            sampleResult{1}(1,1)=(sum(sample_class))/sam(1);
     
        


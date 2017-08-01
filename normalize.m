%归一化，将光谱归一化，提取同一地物的归一化光谱
%可以设置系数，放大光谱值，用来方法差异
function M=normalize(M,length)
[row,column]=size(M{1});
index=input('请输入光谱增益系数：\n');
for i=1:row
    for j=1:column
        for k=1:length
            temp(k)=M{k}(i,j);  
        end
        max_temp=max(temp);
        min_temp=min(temp);
        for k=1:length
            y=double((M{k}(i,j)-min_temp)/(max_temp-min_temp));
            M{k}(i,j)=y*index;
        end
    end
end

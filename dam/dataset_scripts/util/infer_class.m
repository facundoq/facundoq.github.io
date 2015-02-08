function inferred_classes=infer_class(results)
samples=size(results,1);
inferred_classes=zeros(1,samples);

for i=1:samples
    sample_results=results(i,:);
    hits=sample_results==1;
    only_one_model_recognizes=sum(hits)==1;
    if (only_one_model_recognizes)
        inferred_classes(i)=find(hits);
    end
end



% calcular 
% for i=1:length(gestures_test)
%     tp=results(i,classes_test(i))==1;
%     fp=sum(results(i,:)==1)>1;
%     correctly_classified(i)= tp && not(fp);
% end
% error=1-mean(correctly_classified);

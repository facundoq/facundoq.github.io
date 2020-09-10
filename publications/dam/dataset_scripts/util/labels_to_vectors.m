function coded_labels=labels_to_vectors(labels,positive_value,negative_value)
% Example:
% if labels=[1,2,3,2]' and positive_value=1 and negative_value=0
% coded_labels=[
% 1 0 0
% 0 1 0
% 0 0 1
% 0 1 0
%]

coded_labels= negative_value* ones(length(labels),max(labels));

for i=1:length(labels)
    coded_labels(i,labels(i))=positive_value;
end
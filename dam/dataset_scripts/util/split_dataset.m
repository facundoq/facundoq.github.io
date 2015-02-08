function [subset,rest]= split_dataset(elements,percentage_subset,randomize,selected_subjects)
% returns a stratified subset of the array elements
% each element of elements is a struct that contains a field y indicating
% its class. The function returns a subset of elements such that there are
% percentage_subset of elements for each class.

% if selected_persons is specified, the percentage_subset and randomize parameters 
% are not used

    if isempty(randomize)
        randomize=false;
    end

    non_empty_subjects=not(isempty(selected_subjects));
    error_if( randomize && non_empty_subjects,'Cannot select persons and randomize at the same time');

    if (non_empty_subjects)
        [subset, rest]=split_by_subjects(elements,selected_subjects);
    else
        [subset, rest]=split_by_classes(elements,percentage_subset,randomize);
    end
end

function [subset,rest] =split_by_classes(elements,percentage_subset,randomize)

ys=[elements.y];
classes=max(ys);
subset=[];
rest=[];
for class=1:classes
    indices=ys==class;    
    elements_of_class= elements(indices);
    
    if (randomize)
         random_indices=randperm(length(elements_of_class));
         elements_of_class=elements_of_class(random_indices);
    end  
  
    elements_subset = round( length(elements_of_class) * percentage_subset / 100);
    subset_of_class=elements_of_class(1:elements_subset);
    rest_of_class=elements_of_class((elements_subset+1):end);
    subset=[subset, subset_of_class];
    rest=[rest, rest_of_class];
end
end

function [subset,rest] = split_by_subjects(gestures,selected_subjects)
    subjects=[gestures.person];
    members=ismember(subjects,selected_subjects);
    subset=gestures(members);
    rest=gestures(not(members));
end
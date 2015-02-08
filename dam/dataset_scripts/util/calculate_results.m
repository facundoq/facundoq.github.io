function results=calculate_results(inferred_classes,true_classes,all_classes)
    results.error=1-sum(inferred_classes==true_classes)/length(true_classes);
    results.confusion_matrix=confusionmat(true_classes,inferred_classes);
    results.class_distribution=histc(true_classes,0:max(all_classes));
end
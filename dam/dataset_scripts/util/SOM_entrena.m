function results=calculate_results(inferred_classes,classes)
    results.error=1-sum(inferred_classes==classes)/length(classes);
    results.confusion_matrix=confusionmat(classes,inferred_classes);
    results.class_distribution=histc(classes,1:max(classes));
end
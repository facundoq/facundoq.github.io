function new = copy_object(the_object)
% Instantiate new object of the same class.
new = feval(class(the_object));

% Copy all non-hidden properties.
p = properties(the_object);
for i = 1:length(p)
    new.(p{i}) = the_object.(p{i});
end
end
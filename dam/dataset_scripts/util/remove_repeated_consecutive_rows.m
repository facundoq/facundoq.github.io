function x=remove_repeated_consecutive_rows(x)

rows=size(x,1);
repeated_row_indices=[];
for i=2:rows
    if all(x(i,:)==x(i-1,:))
        repeated_row_indices=[repeated_row_indices i];
    end
end

x(repeated_row_indices,:)=[];
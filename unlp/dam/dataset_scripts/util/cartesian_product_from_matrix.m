function product = cartesian_product_from_matrix(M)
% varargin
% class(varargin)
% M
% class(M)
% c=0;

% calculate the cartesian product, interpreting matrix M, with
% [n,m]=size(M)
% as n sets of m elements each
[n,m]=size(M);
cellMatrix=cell(1,n);
for i=1:n
    cellMatrix{i}=M(i,:);
end
[F{1:n}]=ndgrid(cellMatrix{:});

for i=1:n
    G(:,i)=F{i}(:);
end
product = unique(G , 'rows');

end
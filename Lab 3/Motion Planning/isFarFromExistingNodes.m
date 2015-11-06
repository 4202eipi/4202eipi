function isFar = isFarFromExistingNodes(x, y, d, graph, nodeTable)
%isFarFromExistingNodes checks if point (x, y) is far from nodes in graph.

isFar = 1;
for i = 1:numnodes(graph)
    if pdist([nodeTable(i,:);x, y]) <= d
        isFar = 0;
        return
    end
end
end


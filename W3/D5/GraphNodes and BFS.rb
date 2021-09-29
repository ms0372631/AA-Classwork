class GraphNode

    attr_reader :value, :neighbors

    initialize(value)
        @value = value
        @neighbors = []
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
    q = Queue.new
    visited = Set.new()
    q.add(node)

    while !q.empty?
        sz = q.length
        while sz > 0
            sz -= 1
            cur = q.shift
            return cur if cur.value == target_value
            cur.neighbors.each do |neighbor|
                if !visited.include?(neighbor)
                    q.push(neighbor) 
                    visited.push(neighbor)
                end
            end
        end
    end
    nil
end

bfs(a, "b")
bfs(a, "f")
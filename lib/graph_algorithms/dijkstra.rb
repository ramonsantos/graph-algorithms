# frozen_string_literal: true

module GraphAlgorithms
  class Dijkstra
    def execute(graph, source = 0)
      initialize_attributes(graph, source)

      [].tap do |results|
        until unvisited_vertices.empty?
          vertex_index = nearest_vertex

          visits_vertex(vertex_index)

          results[vertex_index] = build_vertex_result(vertex_index)
        end
      end.compact
    end

    private

    attr_reader :graph, :source, :unvisited_vertices, :path, :cost

    def initialize_attributes(graph, source)
      @graph = graph
      @source = source
      @unvisited_vertices = Set.new(0...graph.size)
      @path = {}
      @cost = Hash.new(:infinite).tap { |cost| cost[source] = 0 }
    end

    def nearest_vertex
      minimum_cost = :infinite
      best_vertex = nil

      unvisited_vertices.each do |vertex|
        next if skip_unvisited_vertex?(vertex, minimum_cost)

        minimum_cost = cost[vertex]
        best_vertex = vertex
      end

      best_vertex
    end

    def skip_unvisited_vertex?(vertex, minimum_cost)
      cost[vertex] == :infinite || !best_cost?(vertex, minimum_cost)
    end

    def best_cost?(vertex, minimum_cost)
      minimum_cost == :infinite || cost[vertex] < minimum_cost
    end

    def visits_vertex(vertex)
      unvisited_vertices.delete(vertex)

      neighbors = vertex_neighbors(graph[vertex])

      neighbors.each do |neighbor|
        total_cost = cost[vertex] + graph[vertex][neighbor]

        next if skip_cost_and_path_update?(neighbor, total_cost)

        cost[neighbor] = total_cost
        path[neighbor] = [*path[vertex], vertex]
      end
    end

    def vertex_neighbors(vertex)
      [].tap do |neighbors|
        vertex.each_index { |index| neighbors << index if unvisited_neighbor?(vertex, index) }
      end
    end

    def unvisited_neighbor?(vertex, index)
      vertex[index]&.positive? && unvisited_vertices.include?(index)
    end

    def skip_cost_and_path_update?(vertex, total_cost)
      cost[vertex] != :infinite && cost[vertex] <= total_cost
    end

    def build_vertex_result(vertex)
      return if source_vertex?(vertex)

      {
        vertex: vertex,
        cost: cost[vertex],
        path: "#{path[vertex].join('-')}-#{vertex}"
      }
    end

    def source_vertex?(vertex)
      vertex == source
    end
  end
end

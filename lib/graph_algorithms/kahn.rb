# frozen_string_literal: true

module GraphAlgorithms
  class Kahn
    def execute(graph)
      initialize_attributes(graph)

      until vertices_without_incoming_edges.empty?
        sorted_vertex = sort_next_vertex

        graph.each_pair do |vertex, edges|
          next unless edges.include?(sorted_vertex)

          edges.delete(sorted_vertex)
          solve_vertex(vertex) if edges.empty?
        end
      end

      graph.empty? ? sorted_dependencies : raise(StandardError, 'Circular Dependency')
    end

    private

    attr_reader :graph, :sorted_dependencies, :vertices_without_incoming_edges

    def initialize_attributes(graph)
      @graph = graph
      @sorted_dependencies = Set.new
      @vertices_without_incoming_edges = []

      graph.each_pair { |vertex, edges| solve_vertex(vertex) if edges.empty? }
    end

    def sort_next_vertex
      vertices_without_incoming_edges.delete_at(0).tap do |vertex|
        sorted_dependencies << vertex
      end
    end

    def solve_vertex(vertex)
      vertices_without_incoming_edges << vertex
      graph.delete(vertex)
    end
  end
end

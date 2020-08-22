# frozen_string_literal: true

require_relative 'support/test_helper'
require 'graph_algorithms'

describe GraphAlgorithms::Kahn do
  subject { GraphAlgorithms::Kahn.new }

  describe '#execute' do
    let(:graph) do
      {
        0 => Set.new([]),
        1 => Set.new([]),
        2 => Set.new([1]),
        3 => Set.new([0]),
        4 => Set.new([]),
        5 => Set.new([3]),
        6 => Set.new([2, 4, 5]),
        7 => Set.new([5, 6])
      }
    end

    describe 'when success' do
      let(:expected_result) { Set.new([0, 1, 4, 3, 2, 5, 6, 7]) }

      it { expect(subject.execute(graph)).must_equal(expected_result) }
    end

    describe 'when error' do
      let(:graph_with_circular_dependency) { graph.tap { |graph| graph[6] << 7 } }

      it do
        error = expect { subject.execute(graph_with_circular_dependency) }.must_raise(StandardError)
        expect(error.message).must_equal('Circular Dependency')
      end
    end
  end
end

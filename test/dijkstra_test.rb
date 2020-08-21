# frozen_string_literal: true

require_relative 'support/test_helper'
require 'graph_algorithms'

describe GraphAlgorithms::Dijkstra do
  subject { GraphAlgorithms::Dijkstra.new }

  describe '#execute' do
    let(:graph) do
      [
        [nil, 2, nil, nil, 3, nil, nil, nil],
        [2, nil, nil, 8, nil, 9, 6, nil],
        [nil, nil, nil, nil, nil, 3, 7, nil],
        [nil, 8, nil, nil, nil, nil, nil, 6],
        [3, nil, nil, nil, nil, nil, 5, 9],
        [nil, 9, 3, nil, nil, nil, 4, 5],
        [nil, 6, 7, nil, 5, 4, nil, nil],
        [nil, nil, nil, 6, 9, 5, nil, nil]
      ]
    end

    describe 'when starts from the first vertex' do
      let(:expected_result) do
        [
          { vertex: 1, cost: 2,  path: '0-1' },
          { vertex: 2, cost: 14, path: '0-1-5-2' },
          { vertex: 3, cost: 10, path: '0-1-3' },
          { vertex: 4, cost: 3,  path: '0-4' },
          { vertex: 5, cost: 11, path: '0-1-5' },
          { vertex: 6, cost: 8,  path: '0-1-6' },
          { vertex: 7, cost: 12, path: '0-4-7' }
        ]
      end

      it { expect(subject.execute(graph)).must_equal(expected_result) }
    end

    describe 'when starts from an arbitrary vertex' do
      let(:expected_result) do
        [
          { vertex: 0, cost: 14, path: '2-5-1-0' },
          { vertex: 1, cost: 12, path: '2-5-1' },
          { vertex: 3, cost: 14, path: '2-5-7-3' },
          { vertex: 4, cost: 12, path: '2-6-4' },
          { vertex: 5, cost: 3,  path: '2-5' },
          { vertex: 6, cost: 7,  path: '2-6' },
          { vertex: 7, cost: 8,  path: '2-5-7' }
        ]
      end

      it { expect(subject.execute(graph, 2)).must_equal(expected_result) }
    end
  end
end

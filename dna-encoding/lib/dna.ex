defmodule DNA do
  @encodes %{?\s => 0b0000, ?A => 0b0001, ?C => 0b0010, ?G => 0b0100, ?T => 0b1000}
  @decodes Enum.map(@encodes, fn {k, v} -> {v, k} end) |> Map.new()

  def encode_nucleotide(code_point), do: Map.get(@encodes, code_point)

  def decode_nucleotide(encoded_code), do: Map.get(@decodes, encoded_code)

  def encode([]), do: <<>>
  def encode([n | dna]), do: <<encode_nucleotide(n)::4, encode(dna)::bitstring>>

  def decode(<<>>), do: ''
  def decode(<<n::4, dna::bitstring>>), do: [decode_nucleotide(n) | decode(dna)]
end

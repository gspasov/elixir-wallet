defmodule Mnemonic do
  @moduledoc """
  Module for generating a mnemonic phrase following the BIP-39 standard
  """

  @doc """
  Generates a phrase from a given list of rows
  generated by the GenerateIndexes module, where each index
  represents a row from the wordlist.txt file
  ## Examples
      iex> Mnemonic.generate_phrase([1223, 32, 453])
      "ocean advice december"
  """
  def generate_phrase(rows) do
    phrase = ""
    for row <- rows do
      phrase <> elem(get_wordlist(), row) <> " "
    end
    |> List.to_string()
    |> String.trim()
  end

  defp get_wordlist() do
    {:ok, word_list} = File.read "apps/elixir_wallet/priv/wordlist.txt"
    word_list
    |> String.split("\n")
    |> List.to_tuple()
  end

end

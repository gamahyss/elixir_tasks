# Реализуйте парсер, который читает текст (расширение .txt) и построчно читает его (разделитель \n). Если текст пустой, верните ошибку

defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t()) :: {:ok, any} | {:error, atom}

  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t()]
end

defmodule TextReader do
  @behaviour Parser

  # BEGIN
  @impl Parser
  def extensions do
    [".txt"]
  end

  @impl Parser
  def parse(""), do: {:error, :no_text}

  def parse(text) do
    {:ok, String.split(text, "\n")}
  end
  # END
end

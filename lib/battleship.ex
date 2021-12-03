defmodule Battleship do

  # The board is represented as a 2D array of cells.
  # The origin is 0, 0 in the upper left corner.
  defmodule Coord do

    @boardsize 10

    @enforce_keys [:x, :y]

    defstruct x: 0, y: 0

    def new(x, y) do
      if x < 0 || x >= @boardsize || y < 0 || y >= @boardsize do
        raise "Coordinate out of bounds"
      end

      %__MODULE__{x: x, y: y}
    end

  end

  defmodule Ship do
    defstruct coords: []
    def new(coords) do
      %__MODULE__{coords: coords}
    end
  end

  defmodule Board do

    @boardsize 10

    defstruct cells: %{}

    def new do
      %__MODULE__{cells: %{}}
    end


    def place_ship(board, ship) do
      ship.coords
      |> Enum.reduce(board, fn coord, board ->
        %{board | cells: Map.put(board.cells, coord, :ship)}
      end)
    end

    def draw(board) do
      r = 0..(@boardsize - 1)
      for y <- r, x <- r do
        case board.cells[Coord.new(x, y)] do
          :ship -> "■"
          _ -> "."
        end
      end
      |> Enum.chunk(10)
      |> Enum.map(fn row ->
        row |> Enum.join("")
      end)
      |> Enum.join("\n")
      |> IO.puts
    end

    #
      # def fire(coord)
      #   if coord.x < 0 || coord.x >= @boardsize || coord.y < 0 || coord.y >= @boardsize then
      #     raise "Coordinate out of bounds"
      #   end
    #
      #   @cells[coord.x][coord.y].fire
      # end
    #
      # def hit?(coord)
      #   if coord.x < 0 || coord.x >= @boardsize || coord.y < 0 || coord.y >= @boardsize then
      #     raise "Coordinate out of bounds"
      #   end
    #
      #   @cells[coord.x][coord.y].hit?
      # end
    #
      # def sunk?(coord)
  end
end


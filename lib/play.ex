alias Battleship.Coord
alias Battleship.Board
alias Battleship.Ship


defmodule Play do
  def run() do
    board = Board.new()
    oil = Ship.new([
      Coord.new(0, 0),
      Coord.new(0, 1),
      Coord.new(1, 1),
    ])

    freighter = Ship.new([
      Coord.new(3, 0),
      Coord.new(3, 1),
    ])


    board
    |> Board.place_ship(oil)
    |> Board.place_ship(freighter)
    |> Board.draw()
  end
end

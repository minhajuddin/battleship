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
    |> Board.place_ship(Ship.new([
      Coord.new(8, 6),
      Coord.new(8, 7),
      Coord.new(8, 8),
      Coord.new(8, 9),
      Coord.new(9, 9),
    ]))
    |> Board.draw()
  end
end

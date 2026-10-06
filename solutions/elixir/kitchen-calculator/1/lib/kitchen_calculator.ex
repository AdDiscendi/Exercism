defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(volume_pair) when elem(volume_pair, 0) == :milliliter, do: {:milliliter, get_volume(volume_pair)}
  def to_milliliter(volume_pair) when elem(volume_pair, 0) == :cup, do: {:milliliter, get_volume(volume_pair) * 240}
  def to_milliliter(volume_pair) when elem(volume_pair, 0) == :fluid_ounce, do: {:milliliter, get_volume(volume_pair) * 30}
  def to_milliliter(volume_pair) when elem(volume_pair, 0) == :teaspoon, do: {:milliliter, get_volume(volume_pair) * 5}
  def to_milliliter(volume_pair) when elem(volume_pair, 0) == :tablespoon, do: {:milliliter, get_volume(volume_pair) * 15}

  def from_milliliter(volume_pair, unit) when unit == :milliliter, do: {unit, get_volume(volume_pair)}
  def from_milliliter(volume_pair, unit) when unit == :cup, do: {unit, get_volume(volume_pair) / 240}
  def from_milliliter(volume_pair, unit) when unit == :fluid_ounce, do: {unit, get_volume(volume_pair) / 30}
  def from_milliliter(volume_pair, unit) when unit == :teaspoon, do: {unit, get_volume(volume_pair) / 5}
  def from_milliliter(volume_pair, unit) when unit == :tablespoon, do: {unit, get_volume(volume_pair) / 15}

  def convert(volume_pair, unit), do: volume_pair |> to_milliliter() |> from_milliliter(unit)
end

defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @seconds_in_earth_year 31_557_600
  @seconds_in_mercury_year 0.2408467 * @seconds_in_earth_year
  @seconds_in_venus_year 0.61519726 * @seconds_in_earth_year
  @seconds_in_mars_year 1.8808158 * @seconds_in_earth_year
  @seconds_in_jupiter_year 11.862615 * @seconds_in_earth_year
  @seconds_in_saturn_year 29.447498 * @seconds_in_earth_year
  @seconds_in_uranus_year 84.016846 * @seconds_in_earth_year
  @seconds_in_neptune_year 164.79132 * @seconds_in_earth_year

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case planet do
      :mercury -> {:ok, seconds / @seconds_in_mercury_year}
      :venus -> {:ok, seconds / @seconds_in_venus_year}
      :earth -> {:ok, seconds / @seconds_in_earth_year}
      :mars -> {:ok, seconds / @seconds_in_mars_year}
      :jupiter -> {:ok, seconds / @seconds_in_jupiter_year}
      :saturn -> {:ok, seconds / @seconds_in_saturn_year}
      :uranus -> {:ok, seconds / @seconds_in_uranus_year}
      :neptune -> {:ok, seconds / @seconds_in_neptune_year}
      # sorry pluto
      _ -> {:error, "not a planet"}
    end
  end
end

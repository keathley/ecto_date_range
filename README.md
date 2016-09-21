# EctoDateRange

This is an experiment to get postgres date ranges (and constraints on those ranges) to play nicely with Ecto.

It requires:

* A [migration](https://github.com/keathley/ecto_date_range/blob/master/priv/repo/migrations/20160907213401_create_reservations.exs) to create the `Reservation` model and setup the date range constraint.

* A [custom ecto type](https://github.com/keathley/ecto_date_range/blob/master/lib/ecto_date_range/date_range.ex) to encode and decode the dates that we'll store in our column.

The DateRange type converts a map into a `Postgrex.Range` struct. The dates are loaded and dumped as `Ecto.DateTime` structs.

Once we have the migration and the DateRange type we can create a  [model](https://github.com/keathley/ecto_date_range/blob/master/lib/ecto_date_range/reservation.ex).

The exclusion constraint can be caught with the `exclusion_constraint` helper.

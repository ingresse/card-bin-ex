# CardBinEX

Elixir module to get the creditcard brand based in the first digits.


## Install

```elixir
def deps do
  [
    {:card_bin_ex, git: "https://github.com/ingresse/card-bin-ex.git", tag: "1.0.0"}
  ]
end
```

## Usage

Get creditcard brand

```elixir
iex> Card.brand_from_number(("4716892")
{:ok, "visa"}
```

Invalid creditcard brand

```elixir
iex> Card.brand_from_number("9716892")
{:error, :card_brand, "9716892"}
```

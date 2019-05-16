# CardBinEX

[Elixir](https://elixir-lang.org/) module to get the CreditCard brand based in the first digits.


## Valid CreditCard brands

 | brand            | alias      |
 |------------------|------------|
 | Visa             | `visa`     |
 | Elo              | `elo`      |
 | JBC              | `jbc`      |
 | Diners           | `diners`   |
 | Discover         | `discover` |
 | MasterCard       | `master`   |
 | American Express | `amex`     |

## Install

```elixir
def deps do
  [
    {:card_bin_ex, git: "https://github.com/ingresse/card-bin-ex.git", tag: "1.0.0"}
  ]
end
```

## Usage

Get CreditCard brand

```elixir
iex> Card.brand_from_number("4716892")
{:ok, "visa"}
```

Invalid CreditCard brand

```elixir
iex> Card.brand_from_number("9716892")
{:error, :card_brand, "9716892"}
```

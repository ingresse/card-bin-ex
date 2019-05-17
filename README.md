# :credit_card: CardBinEX

![CircleCI](https://circleci.com/gh/ingresse/card-bin-ex.svg?style=svg&circle-token=85d26c37066199b5453a20bc20b2fe994fc9cd34)

[Elixir](https://elixir-lang.org/) module to discover the CreditCard brand based in the first digits.


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

Get the creditcard brand base in the first digits.

```elixir
iex> CardBinEx.brand_from_number("4716892")
{:ok, "visa"}

iex> CardBinEx.brand_from_number("9716892")
{:error, :card_brand, "9716892"}
```

Get the creditcard brand base in the first digits and return only the brand.

It will raise `CardBinEx.Error` if is an invalid bin.

```elixir
iex> CardBinEx.brand_from_number!("4716892")
"visa"

iex> try do
...>   CardBinEx.brand_from_number!("9716892")
...> rescue
...>   e in CardBinEx.Error -> IO.puts(e.message)
..> end
```


# :credit_card: CardBinEX

[Elixir](https://elixir-lang.org/) module to discover the CreditCard brand based in the first digits.


## Valid CreditCard brands

 | brand            | alias       |
 |------------------|-------------|
 | Visa             | `visa`      |
 | Elo              | `elo`       |
 | JBC              | `jbc`       |
 | Diners           | `diners`    |
 | Discover         | `discover`  |
 | MasterCard       | `master`    |
 | Hipercard        | `hipercard` |
 | American Express | `amex`      |


## Install

```elixir
def deps do
  [
    {:card_bin_ex, "~> 1.0"}
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


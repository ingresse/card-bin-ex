defmodule CardBinExTest do
  use ExUnit.Case

  describe "Validate Brand" do
    @tag :card_brand
    test "VISA" do
      cards = [
        ["411", "visa"],
        ["4111111111111111", "visa"],
        ["4012888888881881", "visa"],
        ["4222222222222", "visa"],
        ["4462030000000000", "visa"],
        ["4484070000000000", "visa"],
        ["411111111111111111", "visa"],
        ["4111111111111111110", "visa"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "ELO" do
      cards = [
        ["431274", "elo"],
        ["451416", "elo"],
        ["457393", "elo"],
        ["401178", "elo"],
        ["401179", "elo"],
        ["438935", "elo"],
        ["457631", "elo"],
        ["457632", "elo"],
        ["4576321111111111", "elo"],
        ["5066991111111118", "elo"],
        ["6277809", "elo"],
        ["6277809990229178", "elo"],
        ["650033", "elo"],
        ["6500331111111111", "elo"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "MASTER" do
      cards = [
        ["2221", "master"],
        ["2222", "master"],
        ["2223", "master"],
        ["2224", "master"],
        ["2225", "master"],
        ["2226", "master"],
        ["2225", "master"],
        ["2226", "master"],
        ["223", "master"],
        ["2239", "master"],
        ["23", "master"],
        ["24", "master"],
        ["25", "master"],
        ["26", "master"],
        ["27", "master"],
        ["270", "master"],
        ["271", "master"],
        ["272", "master"],
        ["2720", "master"],
        ["51", "master"],
        ["52", "master"],
        ["53", "master"],
        ["54", "master"],
        ["55", "master"],
        ["5555555555554444", "master"],
        ["5454545454545454", "master"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "AMEX" do
      cards = [
        ["34", "amex"],
        ["37", "amex"],
        ["341", "amex"],
        ["34343434343434", "amex"],
        ["378282246310005", "amex"],
        ["371449635398431", "amex"],
        ["378734493671000", "amex"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "DINERS" do
      cards = [
        ["30", "diners"],
        ["300", "diners"],
        ["36", "diners"],
        ["38", "diners"],
        ["39", "diners"],
        ["30569309025904", "diners"],
        ["38520000023237", "diners"],
        ["36700102000000", "diners"],
        ["36148900647913", "diners"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "DISCOVER" do
      cards = [
        ["6011", "discover"],
        ["644", "discover"],
        ["644", "discover"],
        ["645", "discover"],
        ["646", "discover"],
        ["647", "discover"],
        ["648", "discover"],
        ["649", "discover"],
        ["6011000400000000", "discover"],
        ["6011111111111117", "discover"],
        ["6011000990139424", "discover"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "JCB" do
      cards = [
        ["1", "jcb"],
        ["35", "jcb"],
        ["2131", "jcb"],
        ["21312", "jcb"],
        ["1800", "jcb"],
        ["18002", "jcb"],
        ["3530111333300000", "jcb"],
        ["3566002020360505", "jcb"],
        ["35308796121637357", "jcb"],
        ["353445444300732639", "jcb"],
        ["3537286818376838569", "jcb"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end

    @tag :card_brand
    test "HIPERCARD" do
      cards = [
        ["606282", "hipercard"],
        ["6062821333300000", "hipercard"]
      ]

      cards
      |> Enum.map(&test_cards/1)

      cards
      |> Enum.map(&test_cards!/1)
    end
  end

  describe "Invalid cards" do
    @tag :card_brand
    test "should return error" do
      cards = [
        ["7"],
        ["0549022254449192"],
        ["9993337259991020"],
        ["3334"]
      ]

      cards
      |> Enum.map(&test_invalid_cards/1)

      cards
      |> Enum.map(&test_invalid_cards!/1)
    end
  end

  defp test_cards([number, brand]) do
    {:ok, card_brand} = CardBinEx.brand_from_number(number)

    assert card_brand == brand
  end

  defp test_cards!([number, brand]) do
    card_brand = CardBinEx.brand_from_number!(number)

    assert card_brand == brand
  end

  defp test_invalid_cards([number]) do
    {:error, :card_bin, card_number} = CardBinEx.brand_from_number(number)

    assert card_number == number
  end

  defp test_invalid_cards!([number]) do
    assert_raise CardBinEx.Error, fn ->
      CardBinEx.brand_from_number!(number)
    end
  end
end

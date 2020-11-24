window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const Tax = 1.10;
    const TaxPrice = inputValue * Tax;
    const priceAfterTax = Math.floor(TaxPrice);
    addTaxDom.innerHTML = priceAfterTax;
    const profitDom = document.getElementById("profit");
    const salesProfit = priceAfterTax - inputValue;
    profitDom.innerHTML = salesProfit;
  })
});

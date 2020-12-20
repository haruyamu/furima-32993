function price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", (e) => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    const profitCalc = Math.floor(inputValue - tax);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    if (300 <= inputValue <=9999999){
      addTaxPrice.innerHTML = tax
      profit.innerHTML = profitCalc
    };
  });
}
window.addEventListener('load', price);

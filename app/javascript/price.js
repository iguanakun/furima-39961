function price (){
  const form = document.getElementById("item-price");
  form.addEventListener("keyup", (e) => { // フォームに入力された時
    const tax_price = document.getElementById("add-tax-price"); // 税率
    const profit = document.getElementById("profit"); // 利益
    const tax_price_num = Math.floor(form.value * 0.1);
    const profit_num = Math.floor(form.value - tax_price_num);
    tax_price.innerHTML = `${tax_price_num.toLocaleString()}`;
    profit.innerHTML = `${profit_num.toLocaleString()}`;
  });
};
 
window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price); // エラーハンドリング
var products = [];

if (JSON.parse(localStorage.getItem("products")) !== undefined) {
  products = JSON.parse(localStorage.getItem("products"));
}

function commitProducts() {
  localStorage.setItem("products", JSON.stringify(products));
  document.getElementById("cart_container").innerHTML = "";
  renderCartProducts();
}

function addProductToCart(product) {
  products.push(product);
  commitProducts();
}

function deleteProductFromCart(id) {
  for (let i = 0; i < products.length; i++) {
    if (products[i].id === id) {
      products.splice(i, 1);
    }
  }

  commitProducts();
}

function renderCartProducts() {
  let cartContainer = document.getElementById("cart_container");
  let total = 0;

  if (products.length > 0) {
    products.forEach(product => {
      cartContainer.innerHTML += `<div class="navbar-item"><button onClick="deleteProductFromCart(${
        product.id
      })" class="button is-danger is-small">
    <span class="icon"><i class="fas fa-times"></i></span></button>
                      <p>${product.name}</p>
                      <hr class="navbar-divider"></div>`;

      total += parseInt(product.price);
    });

    document.getElementById("total_text").style.display = "block";
    document.getElementById("total_text").innerHTML = `<b>Total: </b>$${total}`;
  } else {
    document.getElementById("total_text").style.display = "none";
    cartContainer.innerHTML = `<div class="navbar-item"><p class="has-text-black">No has agregado productos al carrito</p></div>`;
  }
}

renderCartProducts();

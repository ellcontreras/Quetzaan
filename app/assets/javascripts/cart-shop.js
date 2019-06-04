document.addEventListener("turbolinks:load", function() {
  var products = [];

  try {
    console.log("A ver");

    if (
      JSON.parse(localStorage.getItem("products")) != null ||
      JSON.parse(localStorage.getItem("products")) != undefined
    ) {
      console.log("A ver 1");
      products = JSON.parse(localStorage.getItem("products"));
    }
  } catch (er) {
    console.log(er);
  }

  function commitProducts() {
    localStorage.setItem("products", JSON.stringify(products));
    try {
      document.getElementById("cart_container").innerHTML = "";
    } catch (e) {
      console.log(e);
    }
    renderCartProducts();
  }

  function addProductToCart(product) {
    if (products.filter(p => p.id === product.id).length === 0) {
      products.push(product);
      toastr.success(
        "Agregado al carrito!",
        "El producto se ha agregado al carrito"
      );
      return commitProducts();
    }

    toastr.warning("Ese producto ya esta en el carrito", "Info!");
  }

  function deleteProductFromCart(id) {
    for (let i = 0; i < products.length; i++) {
      if (products[i].id === id) {
        products.splice(i, 1);
      }
    }

    toastr.error(
      "Eliminado del carrito!",
      "El producto se ha eliminado del carrito"
    );

    commitProducts();
  }

  function renderCartProducts() {
    try {
      let cartContainer = document.getElementById("cart_container");

      if (cartContainer != null) {
        let total = 0;

        if (products.length > 0) {
          products.forEach(product => {
            cartContainer.innerHTML += `<div class="navbar-item"><button onClick="deleteProductFromCart(${
              product.id
            })" class="button is-danger is-small">
    <span class="icon"><i class="fas fa-times"></i></span></button>
                      <span class="has-text-black">${product.name}</span>
                      <hr class="navbar-divider"></div>`;

            total += parseInt(product.price);
          });

          document.getElementById("total_text").style.display = "block";
          document.getElementById(
            "total_text"
          ).innerHTML = `<b>Total: </b>$${total}`;
        } else {
          document.getElementById("total_text").style.display = "none";
          cartContainer.innerHTML = `<div class="navbar-item"><p class="has-text-black">No has agregado productos al carrito</p></div>`;
        }
      }
    } catch (e) {
      console.log(e);
    }
  }

  renderCartProducts();
});

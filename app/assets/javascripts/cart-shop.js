// const store = new Vuex.Store({
//     state: {
//         products: []
//     }
// })

var cartDisplay = new Vue({
  el: "#cart-shop",
  data: () => ({
    products: []
  }),
  beforeMount() {
    this.products = JSON.parse(localStorage.getItem("products")) || [];
  },
  beforeDestroy() {
    localStorage.setItem("products", JSON.stringify(this.products));
  },
  computed: {
    total() {
      let t = 0;

      this.products.forEach(product => {
        t += product.price;
      });

      return t;
    }
  }
});

var cartButtonAdd = Vue.component("cart-button", {
  template: `<button class="button" @click='addToCart'>Añadir al carrito</button>`,
  props: ["id", "name", "price"],
  methods: {
    addToCart(el) {
      cartDisplay.products.push({
        id: this.id,
        name: this.name,
        price: this.price
      });
    }
  }
});

var cartButtonDelete = Vue.component("cart-button-delete", {
  template: `<button class="button is-danger" title="Quitar producto del carrito" @click="handleDelete">
                    <span class="icon">
                        <i class="fas fa-times"></i>
                    </span>
                </button>`,
  props: ["id"],
  methods: {
    handleDelete() {
      for (var i = 0; i < cartDisplay.products.length; i++) {
        if (cartDisplay.products[i].id === this.id) {
          cartDisplay.products.splice(i, 1);
        }
      }
    }
  }
});

var showProduct = new Vue({
  el: "#show-products"
});
